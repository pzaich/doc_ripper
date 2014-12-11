require 'spec_helper'

module DocRipper
  describe 'provide a clean api to return the text from a document' do
    let(:doc_path)     { "#{FIXTURE_PATH}lorem.doc"  }
    let(:docx_path)    { "#{FIXTURE_PATH}lorem.docx" }
    let(:pdf_path)     { "#{FIXTURE_PATH}lorem.docx" }
    let(:invalid_path) { "#{FIXTURE_PATH}missing_file.docx" }
    let(:invalid_file_type) { "#{FIXTURE_PATH}lorem.jpg"}
    let(:missing_path) { "#{
      FIXTURE_PATH}some_missing_path.docx" }

    context '#rip' do

      it 'should respond to #rip' do
        expect(DocRipper.respond_to? :rip).to eq(true)
      end

      it 'should respond with text to valid file extensions' do
        expect(DocRipper.rip(doc_path)).not_to eq(nil)
        expect(DocRipper.rip(docx_path)).not_to eq(nil)
        expect(DocRipper.rip(pdf_path)).not_to eq(nil)
      end

      it 'should respond with nil if file is missing' do
        expect(DocRipper.rip(missing_path)).to eq(nil)
      end


      it 'should respond with nil if the file is the wrong type' do
        expect(DocRipper.rip(invalid_path)).to eq(nil)
      end

      it 'should remove the dumped text version of the file' do

      end

    end

    context '#rip!' do

      it 'should respond with an exception if the file is missing' do
        expect{DocRipper.rip!(invalid_path)}.to raise_error(FileNotFound)
      end

      it 'should respond with an exception if the file is the wrong type of extension' do
        expect{DocRipper.rip!(invalid_file_type)}.to raise_error(UnsupportedFileType)
      end

      it 'should respond with an exception if the text file is nil' do
      end

    end


  end
end