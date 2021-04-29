require 'rails_helper'

RSpec.feature 'User authentications', type: :feature do
  scenario 'A new user should enter valid credentials to register' do
    visit new_user_registration_path
    fill_in :Name, with: 'Mih'
    fill_in :Email, with: 'mih@gmail.com'
    fill_in 'Password (6 characters minimum)', with: 'mypass1'
    fill_in 'Confirm Password', with: 'mypass1'
    click_on 'Register'
  end

  scenario 'should enter valid email and password to login and visit his profile page' do
    visit new_user_session_path
    fill_in :Email, with: 'mih@gmail.com'
    fill_in :Password, with: 'mypass1'
    click_on 'Login'
    visit root_path
  end
end
