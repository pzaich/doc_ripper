module DocRipper
  module Formats
    class PdfRipper < Ripper::Base

      def rip
        @text ||= %x(pdftotext #{to_shell(file_path)} -)
      end

    end
  end
end
