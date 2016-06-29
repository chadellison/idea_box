require "rails_helper"

RSpec.feature "User can add an idea" do
  scenario "User sees new idea" do
    skip
    visit root_path

    expect(page).not_to have_content "this new idea"
    expect(page).not_to have_content "don't be too clever"

    fill_in "Title", with: "this new idea"
    fill_in "Body", with: "don't be too clever"
    click_on "Save"

    expect(page).to have_content "this new idea"
    expect(page).to have_content "don't be too clever"
  end
end
