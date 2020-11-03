require_relative 'gilded_rose'

class RegularItem < Item

  def end_of_day_update
    update_sell_in
    update_quality
  end

  protected
    def update_quality
      if @sell_in <= 0
        @quality -= 2
      else
        @quality -= 1
      end

      @quality = 0 if @quality < 0
    end

    def update_sell_in
      @sell_in -= 1
    end
end
