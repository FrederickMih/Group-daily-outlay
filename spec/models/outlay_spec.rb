require 'rails_helper'

RSpec.describe Outlay, type: :model do

 before(:example) do
      @user = User.create!(name: 'Fred')
      @amount = 60
 end
 
   it "is valid with valid attributes" do
    outlay = Outlay.new(name: 'fred', amount: 5, author_id: @user.id)
    expect(outlay).to be true
   end

   it "is valid with valid attributes" do
    outlay = Outlay.new(name: 'fred', amount: @amount, author_id: @user.id)
    expect(outlay).to be_valid
   end

   it " Does not validate if the user does not exist" do
    outlay = Outlay.new(name: 'fd', amount: @amount, author_id: @user.id)
    expect(outlay.valid?).to be false
   end

 

end

