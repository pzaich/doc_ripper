module DocRipper
  module Ripper

    class Base
      attr_reader :text

      def initialize(file_path)
        @file_path      = file_path
        @text_file_path = "#{file_path.split('.').first}.txt"
      end
    end

  end
end