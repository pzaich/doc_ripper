module DocRipper
  class TextRipper < Ripper::Base

    def rip
      @text ||=choose_ripper
    end

    def read
      @file ||= File.open(@text_file_path) if rip
    end

    private

    def choose_ripper
      case
      when !!(@file_path[-5.. -1] =~ /.docx/i)
        puts 'docx'
        DocxRipper.new(@file_path).rip
      when !!(@file_path[-4.. -1] =~ /.doc/i)
        puts 'doc'
        MsDocRipper.new(@file_path).rip
      when !!(@file_path[-4..-1]  =~ /.pdf/i)
        puts 'pdf'
        @PdfRipper.new(@file_path).rip
      end
    end

  end
end