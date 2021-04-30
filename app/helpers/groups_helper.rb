# rubocop:disable Layout/LineLength
module GroupsHelper
  def display_icon(group)
    if group.icon.attached?
      image_tag group.display_image, class: 'group-img'
    else
      image_tag 'group_icon.png', class: 'group-img'
    end
  end

  def edit_group_link(group)
    return unless group.user_id == current_user.id

    link_to '<i class="small material-icons teal-text darken-4">mode_edit</i>'.html_safe, edit_group_path(group)
  end

  def delete_group_link(group)
    return unless group.user_id == current_user.id

    link_to '<i class="small material-icons deep-orange-text- accent-3">delete</i>'.html_safe, group, method: :delete,
                                                                                                      date: { confirm: 'Are you sure?' }
  end

  def edit_outlay_link(outlay)
    return unless outlay.user_id == current_user.id

    link_to '<i class="small material-icons teal-text darken-4">mode_edit</i>'.html_safe, edit_outlay_path(group)
  end

  def delete_outlay_link(outlay)
    return unless outlay.user_id == current_user.id

    link_to '<i class="small material-icons deep-orange-text- accent-3">delete</i>'.html_safe, outlay, method: :delete,
                                                                                                       date: { confirm: 'Are you sure?' }
  end
end

# rubocop:enable Layout/LineLength
