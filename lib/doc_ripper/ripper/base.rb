module DocRipper
  module Ripper

    class Base
      attr_reader :text

      def initialize(file_path)
        @file_path      = file_path
        @text_file_path = "#{file_path.split('.').first}.txt"
      end

      private

      def to_shell(file_path)
        Shellwords.escape(file_path)
      end
    end

  end
end