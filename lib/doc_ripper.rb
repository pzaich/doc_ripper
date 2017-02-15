require 'shellwords'
require "doc_ripper/version"
require "doc_ripper/base"
require "doc_ripper/text_ripper"
require "doc_ripper/formats/pdf_ripper"
require "doc_ripper/formats/docx_ripper"
require "doc_ripper/formats/ms_doc_ripper"
require "doc_ripper/formats/sketch_ripper"
require "doc_ripper/exceptions"

module DocRipper
  class << self
    def rip(path, options = {})
      TextRipper.new(path, options).text
    end

    def rip!(path)
      text = rip(path, raise: true)

      text || raise(FileNotFound)
    end
  end
end
