require "rails_helper"

RSpec.feature "User can see ideas" do
  scenario "User sees ideas", js: true do
    skip
    visit root_path

    fill_in "title", with: "great things"
    fill_in "body", with: "things that are great"
    click_on "Save"

    expect(page).to have_content "great things"
    expect(page).to have_content "things that are great"
    expect(page).to have_content "Quality: swill"
  end
end
