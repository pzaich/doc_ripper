module DocRipper
  class TextRipper < Ripper::Base

    def rip
      case @file_path
      when @file_path[-4.. -1] =~ /.doc$/i
        MsDocRipper.new(@file_path).rip
      when @file_path[-5.. -1] =~ /.docx$/i
        #docx ripper
        DocxRipper.new(@file_path).rip
      when @file_path[-4..-1]  =~ /.pdf$/i
        PdfRipper.new(@file_path).rip
      end
    end

    def read
      File.open(@text_file_path) if rip
    end

  end
end