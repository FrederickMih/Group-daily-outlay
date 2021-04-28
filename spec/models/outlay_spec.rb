require 'rails_helper'

RSpec.describe Outlay, type: :model do

 before(:example) do
      @user = User.create!(name: 'Fred', email: 'mih@gmail.com', password: '222222')
      @amount = 60
 end

   it "is valid with valid attributes" do
    outlay = Outlay.new(name: 'fred', amount: @amount, author_id: @user.id)
    expect(outlay.valid?).to be true
   end

   it "is valid with valid attributes" do
    outlay = Outlay.new(name: 'fred', amount: @amount, author_id: @user.id)
    expect(outlay).to be_valid
   end

   it " Does not validate if the user does not exist" do
    outlay = Outlay.new(name: 'fd', amount: @amount, author_id: @user.id)
    expect(outlay.valid?).to be false
   end

   it "Does not validate with name length < 3" do
    outlay = Outlay.new(name: 'fr', amount: @amount, author_id: @user.id)
    expect(outlay.valid?).to be false
   end

   it "Does not validate if the amount is not a number" do
    outlay = Outlay.new(name: 'fr', amount: 'dollar', author_id: @user.id)
    expect(outlay.valid?).to be false
   end

   it "Validate outlay if the name is in the range 3 < name <= 60 " do
    outlay = Outlay.new(name: 'Ngum1', amount: @amount, author_id: @user.id)
    expect(outlay.valid?).to be true
   end


 

end

