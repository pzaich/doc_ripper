require 'shellwords'
require "doc_ripper/version"
require "doc_ripper/ripper/base"
require "doc_ripper/text_ripper"
require "doc_ripper/pdf_ripper"
require "doc_ripper/docx_ripper"
require "doc_ripper/ms_doc_ripper"
require "doc_ripper/exceptions"

module DocRipper
  class << self
    def rip(path, options = {})
      TextRipper.new(path, options).text
    end

    def rip!(path)
      text = rip(path, raise: true)
      if text
        text
      else
        raise FileNotFound
      end
    end
  end
end