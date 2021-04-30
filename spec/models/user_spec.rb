require 'rails_helper'
RSpec.describe User, type: :model do
  it 'Does not validates user if length of name is < 3' do
    user = User.new(name: 'Mo')
    expect(user.valid?).to be false
  end

  it 'Does not validates user if name already exit' do
    User.create!(name: 'Fred', email: 'fred@gmail.com', password: 222_222)
    user = User.new(name: 'Fred', email: 'mih@gmail.com', password: 111_111)
    expect(user.valid?).to be false
  end

  it 'Does not validates user if email already exit' do
    User.create!(name: 'fred', email: 'Fred@gmail.com', password: 111_111)
    user = User.new(name: 'mih', email: 'Fred@gmail.com', password: 444_444)
    expect(user.valid?).to be false
  end

  it 'Does not validates user if password already exit' do
    User.create!(name: 'fred', email: 'fred@gmail.com', password: 555_555)
    user = User.new(name: 'mih', email: 'mih@gmail.com', password: 555_555)
    expect(user.valid?).to be true
  end

  describe 'associations' do
    it { should have_many(:outlays) }
    it { should have_many(:groups) }
    it { should have_one_attached(:avatar) }
  end

  describe 'validations for names' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:name).is_at_most(30) }
  end

  describe 'validations for names' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:name).is_at_most(30) }
  end

  # describe "validations for author_id" do
  #    it { should validate_length_of(:author_id).is_equal_to(5) }
  # end
end
