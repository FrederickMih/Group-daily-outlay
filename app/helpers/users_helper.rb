module UsersHelper
  def show_avatar(_user)
    if current_user.avatar.attached?
      image_tag current_user.avatar, class: 'avatar rounded_circle'
    else
      image_tag 'avatar.jpg', class: 'avatar rounded_circle'
    end
  end
end
