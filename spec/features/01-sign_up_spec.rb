require 'rails_helper'

feature 'sign_up' do
  scenario 'specify valid and required information' do
    visit new_user_session_url
    click_link 'Sign up'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Username', with: 'jsmith'
    fill_in 'Email', with: 'email@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    visit new_user_session_url
    click_link 'Sign up'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password confirmation does not match' do
    visit new_user_session_url
    click_link 'Sign up'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'incorrectpassword'
    
    click_button 'Sign up'
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign Out')
  end
end
