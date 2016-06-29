require "rails_helper"

RSpec.describe Idea do
  context "roles" do
    it { is_expected.to define_enum_for(:quality) }
  end

  context "update_quality" do
    it "updates the quality" do
      idea = Idea.create(title: "this", body: "that", quality: 0)
      expect(idea.quality).to eq "swill"
      idea.update_quality("1")
      expect(Idea.find(idea.id).quality).to eq "plausible"
    end

    it "updates negative values" do
      idea = Idea.create(title: "this", body: "that", quality: 1)
      expect(idea.quality).to eq "plausible"
      idea.update_quality("-1")
      expect(Idea.find(idea.id).quality).to eq "swill"
    end

    it "does not get better than genius" do
      idea = Idea.create(title: "this", body: "that", quality: 2)
      expect(idea.quality).to eq "genius"
      idea.update_quality("1")
      expect(Idea.find(idea.id).quality).to eq "genius"
    end

    it "does not get worse than swill" do
      idea = Idea.create(title: "this", body: "that", quality: 0)
      expect(idea.quality).to eq "swill"
      idea.update_quality("-1")
      expect(Idea.find(idea.id).quality).to eq "swill"
    end
  end
end
