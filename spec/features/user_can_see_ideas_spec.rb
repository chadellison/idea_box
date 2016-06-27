require "rails_helper"

RSpec.feature "User can see ideas" do
  scenario "User sees ideas" do
    idea = Idea.create(title: "great things", body: "things that are great")

    visit root_path

    expect(page).to have_content "great things"
    expect(page).to have_content "things that are great"
    expect(page).to have_content "Quality: swill"
  end
end
