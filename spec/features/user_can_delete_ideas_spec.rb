require "rails_helper"

RSpec.feature "user can remove ideas" do
  scenario "users no longer sees the ideas", js: true do
    skip
    visit root_path

    expect(page).to have_content "this new idea"
    expect(page).to have_content "don't be too clever"

    click_on "Delete"

    expect(page).not_to have_content "This new idea"
    expect(page).not_to have_content "don't be too clever"
  end
end
