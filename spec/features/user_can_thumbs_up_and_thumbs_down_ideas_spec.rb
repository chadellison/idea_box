require "rails_helper"

RSpec.feature "user can thumbs up an idea" do
  scenario "user sees adjusted idea quality" do
    idea1 = Idea.create(title: "my idea", body: "the body of my idea")
    idea2 = Idea.create(title: "another idea", body: "a thing!")

    visit root_path

    within("##{idea1.id}") do
      expect(page).to have_content "Quality: swill"
    end

    within("##{idea2.id}") do
      expect(page).to have_content "Quality: swill"
    end

    within("##{idea2.id}") do
      click_on "thumbs up"
    end

    within("##{idea2.id}") do
      expect(page).to have_content "Quality: plausible"
    end

    within("##{idea1.id}") do
      expect(page).to have_content "Quality: swill"
    end
  end

  scenario "ideas cannot be better than genius" do
  end

  scenario "ideas cannot be worse than swill" do
  end
end
