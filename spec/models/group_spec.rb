require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:example) do
    @user = User.create!(name: 'Frederick', email: 'mih@gmail.com', password: '333333')
    @amount = 60
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:outlays_groups) }
    it { should have_one_attached(:icon) }
  end

  it 'Does not validate group name with length < 3' do
    group = Group.new(name: 'gr', user_id: @user.id)
    expect(group.valid?).to be false
  end

  it 'Does not validate a group if user does not exist' do
    group = Group.new(name: 'gr', user_id: 9)
    expect(group.valid?).to be false
  end

  it 'Validate groups with name length >= 3 and existing user' do
    group = Group.new(name: 'Electronics', user_id: @user.id)
    expect(group.valid?).to be true
  end
end
