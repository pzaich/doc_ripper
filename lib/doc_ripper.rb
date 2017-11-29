require 'shellwords'
require 'doc_ripper/version'
require 'doc_ripper/base'
require 'doc_ripper/formats/text_ripper'
require 'doc_ripper/formats/pdf_ripper'
require 'doc_ripper/formats/docx_ripper'
require 'doc_ripper/formats/ms_doc_ripper'
require 'doc_ripper/formats/sketch_ripper'
require 'doc_ripper/exceptions'

module DocRipper
  class << self
    def rip(path, options = {})
      ripper = choose_ripper(path)
      ripper.text unless ripper.nil?
    end

    def rip!(path)
      ripper = choose_ripper(path)
      raise(UnsupportedFileType) if ripper.nil?

      ripper.text || raise(FileNotFound)
    end

    private

    def choose_ripper(file_path)
      ripper = begin
        case
        when !!(file_path =~ /.docx$/i)
          ripper = Formats::DocxRipper.new(file_path)
        when !!(file_path =~ /.doc$/i)
          ripper = Formats::MsDocRipper.new(file_path)
        when !!(file_path =~ /.pdf$/i)
          ripper = Formats::PdfRipper.new(file_path)
        when !!(file_path =~ /.sketch$/i)
          ripper = Formats::SketchRipper.new(file_path)
        when !!(file_path =~ /.txt$/i)
          ripper = Formats::TextRipper.new(file_path)
        end
      end

      ripper
    end
  end
end
