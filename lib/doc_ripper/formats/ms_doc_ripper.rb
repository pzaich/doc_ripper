module DocRipper
  module Formats
    class MsDocRipper < Ripper::Base

      def rip
        @text ||= %x(antiword #{to_shell(file_path)})
      end

    end
  end
end
