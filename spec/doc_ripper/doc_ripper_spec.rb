require 'spec_helper'

module DocRipper
  describe 'provide a clean api to return the text from a document' do
    let(:docx_path) { }
    let(:invalid_path) { }

    context '#rip' do

      it 'should respond to #rip' do
        expect(DocRipper.respond_to? :rip).to eq(true)
      end

      it 'should respond with text to valid file extensions ' do
        puts "#{FIXTURE_PATH}lorem.doc"
        expect(DocRipper.rip("#{FIXTURE_PATH}lorem.doc")).not_to eq(nil)
      end

      it 'should respond with nil if file is missing' do

      end


      it 'should respond with nil if the file is the wrong type' do

      end

      it 'should remove the dumped text version of the file' do

      end

    end

    context '#rip!' do

      it 'should respond with an exception if the file is missing' do

      end

      it 'should respond with an exception if the file is the wrong type of extension' do

      end

      it 'should respond with an exception if the text file is nil' do
      end

    end


  end
end