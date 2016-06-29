require "rails_helper"

RSpec.feature "user can thumbs up an idea" do
  scenario "user sees adjusted idea quality" do
    skip

    visit root_path

    fill_in "title", with: "my idear"
    fill_in "body", with: "this thing"
    click_on "Save"

    click_on "thumbs up"

    expect(page).to have_content "Quality: plausible"
  end

  scenario "ideas cannot be better than genius" do
  end

  scenario "ideas cannot be worse than swill" do
  end
end
