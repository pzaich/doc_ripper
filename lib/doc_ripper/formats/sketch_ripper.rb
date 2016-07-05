module DocRipper
  module Formats
    class SketchRipper < Ripper::Base
      def read_type
        :mem
      end

      def rip
        puts '@' * 100
        db = SQLite3::Database.new(@file_path)
        @text ||= db.execute("SELECT value FROM payload").flatten
      end
    end
  end
end