require 'active_support'
require 'active_support/core_ext'
require 'cfpropertylist'

module DocRipper
  module Formats
    class SketchRipper < Ripper::Base

      class CFPropertyList::CFString
        def to_s
          value
        end
      end

      def read_type
        :mem
      end

      def rip
        db = SQLite3::Database.new(@file_path)
        data = db.execute("SELECT value FROM payload").flatten.first
        @text ||= text_objects(data).join(" ")
      end

      def blacklist
        %w(\$null MSAttributedStringFontAttribute NSColor NSParagraphStyle Page)
      end

      def text_objects(data)
        objects = CFPropertyList::List.new(data: data).value.value['$objects'].value

        evaluator = Proc.new do |object, previous_object, next_object|
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
            # Check if the string is defining the name of an artboard
            !(previous_object.is_a?(CFPropertyList::CFDictionary) && previous_object.value['$class'].value == 39)
        end

        objects.select.with_index do |object,i|
          next_object = objects[i+1]
          previous_object = objects[i-1]
          evaluator.call(object, previous_object, next_object)
        end
      end
    end
  end
end