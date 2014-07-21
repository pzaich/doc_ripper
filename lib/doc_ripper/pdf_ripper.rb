module DocRipper
  class PdfRipper < Ripper::Base

    def rip
      @text ||= system(%Q[ pdftotext #{to_shell(@file_path)} > #{to_shell(@text_file_path)} ])
    end

  end
end