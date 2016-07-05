require 'spec_helper'

module DocRipper
  describe 'SketchRipper' do
    let(:simple_sketch_path) { "#{FIXTURE_PATH}simple_sketch_text.sketch" }
    let(:simple_sketch_text) { "Grab some text Grab some text" }

    describe '#rip' do

      let(:ripper) { DocRipper.rip(simple_sketch_path) }

      it 'returns all text labels from Sketch documents' do
        expect(ripper).to eq(simple_sketch_text)
      end
    end
  end
end