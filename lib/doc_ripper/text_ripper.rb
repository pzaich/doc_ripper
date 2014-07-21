module DocRipper
  class TextRipper < Ripper::Base

    def rip
      case @file_path
      when @file_path[-4.. -1] =~ /.doc$/i
        #doc ripper
        DocRipper.new().read
      when @file_path[-5.. -1] =~ /.docx$/i
        #docx ripper
      when @file_path[-4..-1]  =~ /.pdf$/i

      end
    end

    def read
      File.open(@file_path) if rip
    end

  end
end