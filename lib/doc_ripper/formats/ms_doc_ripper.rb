module DocRipper
  module Formats
    class MsDocRipper < Ripper::Base

      def rip
        @text ||= system(%Q[ antiword #{to_shell(@file_path)} > #{to_shell(@text_file_path)} ])
      end

    end
  end
end