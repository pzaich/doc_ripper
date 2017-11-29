require 'spec_helper'

module DocRipper
  describe 'SketchRipper' do
    let(:simple_sketch_path) { "#{FIXTURE_PATH}simple_sketch_text.sketch" }
    let(:simple_sketch_text) { "Page 1 t Grab some text Grab some text t copy" }
    let(:complex_sketch_path) { "#{FIXTURE_PATH}complex_sketch_text.sketch" }
    let(:complex_sketch_text) do
      "Page 1 Onboarding Wizard -- Step 3 Header Rectangle 20 Path UtilityZen UtilityZen Line notification-icons---download-for-free-at-icons8 Shape gear-icons---download-for-free-at-icons8 Rectangle 293 Sync the accounts us Sync the accounts used by 484 Sexton. You\u2019ll be asked to approve access so that we can begin monitoring home usage. Don\u2019t see one of the Don\u2019t see one of the utilities your home uses? Let us know.  2/2 Your Accounts 2/2 Your Accounts Group Rectangle 294 Next step Utility Full Chit Gas + Power Utility Rectangle 279  Pacific_Gas_and_Electric_Company_(logo) Layer_1 g2105 g2107 g2109 path2111 path2111-path g2113 path2115 path2115-path g2117 path2119 path2119-path g2121 path2123 path2123-path g2125 path2127 path2127-path g2129 path2131 path2131-path g2133 path2135 path2135-path path2135-path path2137 path2137-path path2137-path Utility Full Chit Gas + Power Rectangle 279 sfpuc-logo-vert"
    end

    describe '#rip' do

      let(:ripper) { DocRipper.rip(simple_sketch_path) }

      it 'returns all text labels, layer names and page names from Sketch documents' do
        expect(ripper).to eq(simple_sketch_text)
      end

      context 'complex sketch example' do
        let(:ripper) { DocRipper.rip(complex_sketch_path) }

        it 'returns matching text from labels' do
          expect(ripper.split(' ')).to match_array(complex_sketch_text.split(' '))
        end
      end
    end
  end
end
