require "rails_helper"

feature 'user signs in' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:plant) { FactoryGirl.create(:plant) }

  scenario "existing user specifies valid login information" do
    visit new_user_session_path
    sign_in(user)

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "existing user adds a plant to their garden" do
    expect(page).to have_content("GARDEN")
    expect(page).to have_link("New Plant")

    click_link "New Plant"

    expect(page).to have_content("New Plant")
    expect(page).to have_content("Name")
    expect(page).to have_content("Cycle")

    fill_in "Name", with: plant.name
    fill_in "Cycle", with: plant.cycle

    click_link "Create Plant"

    expect(page).to have_content(plant.name)
    expect(page).to have_content(plant.cycle)

  end
end
