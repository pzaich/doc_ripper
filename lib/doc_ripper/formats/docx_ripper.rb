module DocRipper
  module Formats
    class DocxRipper < Ripper::Base

      def rip
        @text ||= system(%Q[ unzip -p #{to_shell(@file_path)} | grep '<w:t' | sed 's/<[^<]*>//g' | grep -v '^[[:space:]]*$' > #{to_shell(@text_file_path)} ])
      end

    end
  end
end