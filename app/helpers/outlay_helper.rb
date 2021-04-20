module OutlayHelper

   def amount_spend_per_day(outlays)
    outlays.inject(0) do |sum, number|
      sum + number.amount
    end
  end

end
