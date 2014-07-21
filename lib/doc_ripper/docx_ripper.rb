module DocRipper
  class DocxRipper < Ripper::Base

    def rip
      @text ||= system(%Q[ unzip -p #{@file_path} | grep '<w:t' | sed 's/<[^<]*>//g' | grep -v '^[[:space:]]*$' > #{@text_file_path} ])
    end

  end
end