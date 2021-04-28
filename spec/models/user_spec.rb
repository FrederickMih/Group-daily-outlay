require 'rails_helper'
RSpec.describe User, type: :model do

    it 'Does not validates user if length of name is < 3' do
      user = User.new(name: 'Mo')
      expect(user.valid?).to be false
   end

   it 'Does not validates user if name already exit' do
      User.create!(name: 'Fred', email: 'fred@gmail.com', password: 222222)
      user = User.new(name: 'Fred', email: 'mih@gmail.com', password: 111111)
      expect(user.valid?).to be false
   end

   it 'Does not validates user if email already exit' do
      User.create!(name: 'fred', email: 'Fred@gmail.com', password: 111111)
      user = User.new(name: 'mih', email: 'Fred@gmail.com', password: 444444)
      expect(user.valid?).to be false
   end

   it 'Does not validates user if password already exit' do
      User.create!(name: 'fred', email: 'fred@gmail.com', password: 555555)
      user = User.new(name: 'mih', email: 'mih@gmail.com', password: 555555)
      expect(user.valid?).to be true
   end



end