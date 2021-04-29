require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do

   describe "show avatar" do
      before(:example) do
            @user = User.create!(name: 'Frederick', email: 'mih@gmail.com', password: '333333')
      end

         it "should display default avatar if avatar is not uploaded" do
         expect(show_avatar(@user)).to eq(image_tag('avatar.jpg', class: 'avatar rounded_circle'))
         end
   end 
   
end

