require "spec_helper"

module DocRipper
  describe "PdfRipper" do
    let(:test_pdf_path) { "#{FIXTURE_PATH}test_pdf.pdf" }
    let(:test_pdf_text) { "A Simple PDF File\nThis is a small demonstration .pdf file just for use in the Virtual Mechanics tutorials. More text. And more\ntext. And more text. And more text. And more text.\nAnd more text. And more text. And more text. And more text. And more\ntext. And more text. Boring, zzzzz. And more text. And more text. And\nmore text. And more text. And more text. And more text. And more text.\nAnd more text. And more text.\nAnd more text. And more text. And more text. And more text. And more\ntext. And more text. And more text. Even more. Continued on page 2 ...\n\n\fSimple PDF File 2\n...continued from page 1. Yet more text. And more text. And more text.\nAnd more text. And more text. And more text. And more text. And more\ntext. Oh, how boring typing this stuff. But not as boring as watching\npaint dry. And more text. And more text. And more text. And more text.\nBoring. More, a little more text. The end, and just as well.\n\n\f" }

    describe "#rip" do

      let(:ripper) { DocRipper.rip(test_pdf_path) }

      it "returns correct text from pdf" do
        expect(ripper.gsub(/\s/, " ")).to eq(test_pdf_text.gsub(/\s/, " "))
      end
    end
  end
end
