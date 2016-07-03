module DocRipper
  module Formats
    class SketchRipper < Ripper::Base
      # db = SQLite3::Database.new File.expand_path("~/Desktop/grab_text.sketch")
      # db.execute("SELECT value FROM payload").flatten.first.b
    end
  end
end