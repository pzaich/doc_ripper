module DocRipper
  class MsDocRipper < Ripper::Base

    def rip
      @text ||= system(%Q[ antiword #{@file_path} > #{@text_file_path} ])
    end

  end
end