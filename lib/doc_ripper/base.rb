module DocRipper
  module Ripper

    class Base
      attr_reader :file_path

      def initialize(file_path)
        file_parts      = file_path.split('.')
        @file_path      = file_path
        @extension      = file_parts.last
      end

      def text
        @text ||= rip
      end

      private

      def to_shell(file_path)
        Shellwords.escape(file_path)
      end
    end

  end
end
