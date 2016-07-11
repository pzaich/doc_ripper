#encoding: UTF-8

module DocRipper
  class TextRipper < Ripper::Base
    attr_reader :text_file_path, :file_path

    def ripped?
      @is_ripped ||=choose_ripper
    end

    def text
      if ripped? && @ripper.read_type == :file
        @text = IO.read(@text_file_path).force_encoding("ISO-8859-1").encode("utf-8", replace: nil)
        File.delete(@text_file_path)

      elsif ripped? && @ripper.read_type == :mem
        @text = @ripper.text
      end

      @text
    end

    private

    def choose_ripper
      case
      when !!(@file_path =~ /.docx$/i)
        @ripper = Formats::DocxRipper.new(@file_path)
      when !!(@file_path =~ /.doc$/i)
        @ripper = Formats::MsDocRipper.new(@file_path)
      when !!(@file_path =~ /.pdf$/i)
        @ripper = Formats::PdfRipper.new(@file_path)
      when !!(@file_path =~ /.sketch$/i)
        @ripper = Formats::SketchRipper.new(@file_path)
      when @options[:raise]
        raise UnsupportedFileType
      end

      @ripper.rip
    end

  end
end