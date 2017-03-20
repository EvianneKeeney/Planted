require "rails_helper"

feature 'user signs in' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "existing user specifies valid login information" do
    visit new_user_session_path
    sign_in(user)

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "nonexistant log in information supplied" do
    visit user_session_path
    fill_in "Email", with: "noncorrect@email.com"
    fill_in "Password", with: "notcorrectPassword"
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
    expect(page).to_not have_content("Welcome Back!")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "Existing user supplies wrong password" do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "notcorrectPassword"
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
    expect(page).to_not have_content("Welcome Back!")
  end

  scenario "an already authenticated user cannot re-sign in" do
    visit new_user_session_path
    sign_in(user)

    expect(page).to have_content("Signed in successfully.")

    visit new_user_session_path

    expect(page).to have_content("Sign Out")
    expect(page).to have_content("You are already signed in")
    expect(page).to_not have_content("Log in")
  end
end
