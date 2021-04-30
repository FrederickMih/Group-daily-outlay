require 'rails_helper'

RSpec.feature 'Outlay and Group', type: :feature do
  before(:each) do
    visit new_user_registration_path
    fill_in :Name, with: 'fred'
    fill_in :Email, with: 'fred@gmail.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on 'Register'

    visit new_group_path
    fill_in :Name, with: 'Frist Group'
    click_on 'New Group'

    visit root_path
    click_on ' All My Daily Outlays'
    visit new_outlay_path
    fill_in :Name, with: 'FirstItem'
    fill_in 'Amount (in $)', with: '50'
    check 'First Group'
    click_on 'New Expense'
    click_on 'Sign out'

    visit new_user_registration_path
    fill_in :Name, with: 'Peter'
    fill_in :Email, with: 'piere@gmail.com'
    fill_in 'Password (6 characters minimum)', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on 'Register'
  end
end
