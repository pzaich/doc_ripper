require 'spec_helper'

module DocRipper
  describe 'SketchRipper' do
    let(:simple_sketch_path) { "#{FIXTURE_PATH}simple_sketch_text.sketch" }
    let(:simple_sketch_text) { "Grab some text Grab some text" }
    let(:complex_sketch_path) { "#{FIXTURE_PATH}complex_sketch_text.sketch" }

    describe '#rip' do

      let(:ripper) { DocRipper.rip(simple_sketch_path) }

      it 'returns all text labels from Sketch documents' do
        expect(ripper).to eq(simple_sketch_text)
      end

      context 'complex sketch example' do
        let(:ripper) { DocRipper.rip(complex_sketch_path) }

        it 'returns matching text from labels' do
          expect(ripper).to eq(simple_sketch_text)
        end
      end
    end
  end
end