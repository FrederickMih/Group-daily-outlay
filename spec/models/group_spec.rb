require 'rails_helper'

RSpec.describe Group, type: :model do

 before(:example) do
      @user = User.create!(name: 'Frederick')
      @amount = 60
 end

   it "Does not validate group name with length < 3" do
    group = Group.new(name: 'gr', user_id: @user.id, email: 'fred@gmail.com', password: 222222 )
    expect(group.valid?).to be false
   end

   it "Does not validate a group if user does not exist" do
     group = Group.new(name: 'gr', user_id: 9)
    expect(group.valid?).to be false
   end

   it "Validate groups with name length >= 3 and existing user" do
    group = Group.new(name: 'Electronics', author_id: @user.id)
    expect(group.valid?).to be true
   end
end

