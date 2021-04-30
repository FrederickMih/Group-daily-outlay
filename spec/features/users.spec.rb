require 'rails_helper'

RSpec.feature 'User authentications', type: :feature do
  scenario 'should enter valid email and password to login and visit his profile page' do
    visit new_user_session_path
    fill_in :Email, with: 'mih@gmail.com'
    fill_in :Password, with: 'mypass1'
    click_on 'Login'
    visit root_path
  end

  scenario "A user with invalid email or password can't login" do
    visit new_user_session_path
    fill_in :Email, with: '@fred111'
    fill_in :Password, with: 'passaaaa'
    click_on 'Login'
    expect(page).to have_content 'Log in'
  end

  scenario 'should visit the profile page and see his name' do
    visit root_path
    expect(page).to have_content 'Mih'
  end
end
