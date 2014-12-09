require 'rails_helper'

describe PsycoticLookup do

  context "with a single segment" do
    let(:slug) { 'kitchens' }

    it "should find the segment" do
      lookup = PsycoticLookup.new(slug)
      expect(lookup.ids).to match_array([1])
    end
  end

  context "with a single hyphenated segment" do
    let(:slug) { 'home-exteriors' }

    it "should find the segment" do
      lookup = PsycoticLookup.new(slug)
      expect(lookup.ids).to match_array([7])
    end
  end

  context "with two segments separated by hyphens" do
    context "with taxonomy followed by facet" do
      let(:slug) { 'bathrooms-frameless-showerdoor' }

      it "should find the segments" do
        lookup = PsycoticLookup.new(slug)
        expect(lookup.ids).to match_array([3,8])
      end

      context "with two segments the second starting with a facet" do
        let(:slug) { 'living-rooms-cement-fireplace' }

        it "should find the two segments and ignore fireplace" do
          lookup = PsycoticLookup.new(slug)
          expect(lookup.ids).to match_array([2,10])
        end
      end
    end

    context "with facet followed by taxonomy" do
      let(:slug) { 'frameless-showerdoor-bathrooms' }

      it "should find the segments ordered by taxonony then facet" do
        lookup = PsycoticLookup.new(slug)
        expect(lookup.ids).to match_array([3,8])
      end
    end

  end

  context "with three segments the second and third on same facet" do
    let(:slug) { 'living-rooms-stone-fireplace-cement-fireplace' }

    it "should find the segments" do
      lookup = PsycoticLookup.new(slug)
      expect(lookup.ids).to match_array([2,9,10])
    end
  end

end
