require 'nokogiri'

module DocRipper
  class DocxRipper < Ripper::Base
    def rip
      text = `unzip -p #{to_shell(@file_path)} | grep '<w:t'`
      return unless text && text.length > 0
      doc = Nokogiri::XML(text)
      doc.xpath('//w:del').each(&:remove)
      File.open(@text_file_path, 'w') { |f| f.write doc.xpath('//w:p').map(&:content).join("\n") }
      text
    end
  end
end
