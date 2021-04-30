require 'rails_helper'

RSpec.describe OutlaysGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:outlay) }
    it { should belong_to(:group) }
  end

  before(:example) do
    @user = User.create!(name: 'Fred', email: 'fred@gmail.com', password: '222222')
    @group = Group.create(name: 'Phones', user_id: @user.id)
    @outlay = Outlay.create(name: 'shoes', amount: 77, author_id: @user.id)
  end

  it 'It validates with valid infomation' do
    grp = OutlaysGroup.new(outlay_id: @outlay.id, group_id: @group.id)
    expect(grp.valid?).to be true
  end

  it 'It does not validate if outlay does not exist' do
    grp = OutlaysGroup.new(outlay_id: 100, group_id: @group.id)
    expect(grp.valid?).to be false
  end

  it 'It does not validate if group does not exist' do
    grp = OutlaysGroup.new(group_id: 100, outlay_id: @outlay.id)
    expect(grp.valid?).to be false
  end
end
