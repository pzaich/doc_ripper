module DocRipper
  class TextRipper < Ripper::Base
    attr_reader :text_file_path, :file_path

    def rip
      @is_ripped ||=choose_ripper
    end

    def text
      @text ||= File.open(@text_file_path) if rip
    end

    private

    def choose_ripper
      case
      when !!(@file_path[-5.. -1] =~ /.docx/i)
        DocxRipper.new(@file_path).rip
      when !!(@file_path[-4.. -1] =~ /.doc/i)
        MsDocRipper.new(@file_path).rip
      when !!(@file_path[-4..-1]  =~ /.pdf/i)
        PdfRipper.new(@file_path).rip
      end
    end

  end
end