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

    describe 'full utf-8 encoding' do
      let(:result) { DocRipper.rip(file_path) }

      context 'txt file' do
        let(:str) { '¿Cuál es su nombre?' }
        let(:file_path) { "#{FIXTURE_PATH}encoding_sample.txt" }

        before(:each) do
          File.write(file_path, str)
        end

        it 'maintains encoding' do
          expect(result).to eq(str)
        end

        after(:each) do
          File.delete(file_path)
        end
      end

      describe 'docx file' do
        let(:str) { '四、我们确认，我们完全同意招标文件制定的投标规则，并承诺按照这些规则履行我们的所有义务，包括一旦投标文件被贵方接受，将履行社会资本合作方的义务' }
        let(:file_path) { "#{FIXTURE_PATH}chinese.docx" }

        it 'maintains encoding' do
          puts result.encoding
          expect(result).to include(str)
        end
      end
    end

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
