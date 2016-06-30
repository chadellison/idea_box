require "rails_helper"

RSpec.feature "User can add an idea" do
  scenario "User sees new idea", js: true do
    skip
    visit root_path

    expect(page).not_to have_content "this new idea"
    expect(page).not_to have_content "don't be too clever"

    fill_in "title", with: "this new idea"
    fill_in "body", with: "don't be too clever"
    click_on "Save"

    expect(page).to have_content "this new idea"
    expect(page).to have_content "don't be too clever"
  end
end
