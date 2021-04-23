module OutlayHelper
  def total_outlays(outlays)
    outlays.inject(0) do |sum, number|
      sum + number.amount
    end
  end
end
