module UsersHelper
   def show_avatar(user)
      if user.avatar?
         image_tag user.display_image, class: 'avatar rounded_circle'
      else
         image_tag 'avatar.jpg', class: 'avatar rounded_circle'
      end
   end
end
