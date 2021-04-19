module OutlayHelper

   def amount_spend_per_day(outlays)
    outlays.inject(0) do |count, ex|
      count + ex.amount
    end
  end
  
end
