require 'cfpropertylist'

module DocRipper
  module Formats
    class SketchRipper < Ripper::Base

      class CFPropertyList::CFString
        def to_s
          value
        end
      end

      class CFPropertyList::CFType
        def blacklisted_class?
          return false if !self.value.respond_to?(:[])

          klass = self.value['$class']

          # Sketch Internal ID References
          # 39 = rectangle / artboard / page / group
          # 170 = font definition

          return false if !klass
          [170].include?(klass.value)
        end

        def sketch_page?
          return false if !self.value.respond_to?(:[])
          klass = self.value['$classes']

          return false if !klass
          klass.is_a?(CFPropertyList::CFArray)
        end
      end

      def read_type
        :mem
      end

      def rip
        db = SQLite3::Database.new(@file_path)
        data = db.execute("SELECT value FROM payload").flatten.first
        @text ||= text_objects(data).join(" ").strip
      end

      def blacklist
        %w(\$null MSAttributedStringFontAttribute NSColor NSParagraphStyle)
      end

      def text_objects(data)
        objects = CFPropertyList::List.new(data: data).value.value['$objects'].value

        evaluator = Proc.new do |object, previous_object, n_2_previous_object, next_object|
          coordinatesRegex = /\{\{\d*, \d*}, \{\d*, \d*\}\}|\{[\d.e-]*, [\d.]*\}/

          object.is_a?(CFPropertyList::CFString) &&
            #ignore other blacklisted properties
            blacklist.select { |bl| object.value.match(/#{bl}/) }.empty? &&
            #ignore uuids
            !object.value.match(/\w{8}-\w{4}-\w{4}-\w{4}-\w{12}/) &&
            #ignore coordinates
            !object.value.match(coordinatesRegex) &&
            #ignore font definitions
            previous_object.value != "NSFontNameAttribute" &&
            # labels always have an dictionary defined afterwards
            next_object.is_a?(CFPropertyList::CFDictionary) &&
            # Check if the string is defining the name of an artboard or font
            !(previous_object.respond_to?(:blacklisted_class?) && previous_object.blacklisted_class?) &&
            !(n_2_previous_object.respond_to?(:blacklisted_class?) && n_2_previous_object.blacklisted_class?)
          end

        objects.select.with_index do |object,i|
          next_object = objects[i+1]
          previous_object = objects[i-1]
          n_2_previous_object = objects[i-2]

          evaluator.call(object, previous_object, n_2_previous_object, next_object)
        end
      end
    end
  end
end