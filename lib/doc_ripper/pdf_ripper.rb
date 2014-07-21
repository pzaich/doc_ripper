module DocRipper
  class PdfRipper < Ripper::Base

    def rip
      @text ||= system(%Q[ pdftotext #{@file_path} > #{@text_file_path} ])
    end

  end
end