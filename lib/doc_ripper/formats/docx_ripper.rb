module DocRipper
  module Formats
    class DocxRipper < Ripper::Base

      def rip
        @text ||= begin
          text = %x(unzip -p #{to_shell(file_path)} | grep '<w:t' | sed 's/<[^<]*>//g' | grep -v '^[[:space:]]*$')

          text.empty? ? nil : text
        end
      end

    end
  end
end
