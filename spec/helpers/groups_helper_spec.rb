require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do
  describe 'display icon' do
    before(:example) do
      @user = User.create!(name: 'Frederick', email: 'mih@gmail.com', password: '333333')
      @group = Group.create(name: 'MobilePhones', user_id: @user.id)
    end
    it 'should display the default icon if an icon is not provided' do
      expect(display_icon(@group)).to eq(image_tag('group_icon.png', class: 'group-img'))
    end
  end
end
