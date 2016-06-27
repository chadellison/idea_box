require "rails_helper"

RSpec.describe Idea do
  context "roles" do
    it { is_expected.to define_enum_for(:quality) }
  end
end
