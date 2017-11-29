#encoding: UTF-8

module DocRipper
  module Formats
    class TextRipper < Ripper::Base

      def rip
        File.read(@file_path)
      end

    end
  end
end
