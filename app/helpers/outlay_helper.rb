module OutlayHelper
  def total_outlays(outlays)
    outlays.inject(0) do |sum, number|
      sum + number.amount
    end
  end

  def outlay_icon(outlay)
    if outlay.groups.first.nil?
      image_tag 'outlay_icon.jpg', class: 'outlay_image_icon'
      elseif !outlay.groups.first.icon.attached?
      image_tag 'outlay_icon.jpg', class: 'outlay_image_icon'
    else
      image_tag outlay.groups.first.icon, class: 'outlay_image_icon'
    end
  end
end
