module ApplicationHelper
  def avatar_url_for(user, opts = {})
    size = opts[:size || 32]

    if user.avatar.attached?
      user.avatar.variant(
        resize: "#{size}x#{size}!"
      )
    else
      hash = Digest::MD5.hexdigest(user.name.downcase)
      "https://secure.gravatar.com/avatar/#{hash}.png?s=#{size}"
    end
 end
end
