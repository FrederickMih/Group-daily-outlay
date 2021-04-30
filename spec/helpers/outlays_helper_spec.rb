require 'rails_helper'

RSpec.describe OutlayHelper, type: :helper do
  describe 'total outlays' do
    before(:example) do
      @user = User.create!(name: 'Frederick', email: 'mih@gmail.com', password: '333333')
      5.times do |t|
        Outlay.create(name: "Phones#{t}", amount: t, author_id: @user.id)
      end
      @outlays = Outlay.all
    end

    it 'Should give the total of all outlays' do
      expect(total_outlays(@outlays)).to eq 10
    end
  end
end
