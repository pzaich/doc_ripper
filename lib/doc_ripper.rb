require 'shellwords'
require "doc_ripper/version"
require "doc_ripper/ripper/base"
require "doc_ripper/text_ripper"
require "doc_ripper/pdf_ripper"
require "doc_ripper/docx_ripper"
require "doc_ripper/ms_doc_ripper"

module DocRipper
  class << self
    def rip(path)
      TextRipper.new(path).text
    end
  end
end