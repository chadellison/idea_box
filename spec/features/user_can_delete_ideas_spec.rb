require "rails_helper"

RSpec.feature "user can remove ideas" do
  scenario "users no longer sees the ideas" do
    idea1 = Idea.create(title: "This idea", body: "play in the mud")
    idea2 = Idea.create(title: "rolling on the ground", body: "go roll on the ground")

    visit root_path

    expect(page).to have_content "This idea"
    expect(page).to have_content "play in the mud"
    expect(page).to have_content "rolling on the ground"
    expect(page).to have_content "go roll on the ground"

    within("##{idea1.id}") do
      click_on "Delete"
    end
    expect(page).not_to have_content "This idea"
    expect(page).not_to have_content "play in the mud"

    expect(page).to have_content "rolling on the ground"
  end
end
