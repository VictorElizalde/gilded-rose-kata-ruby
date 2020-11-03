require_relative 'regular_item'

class BackstagePass < RegularItem

  protected
    def update_quality
      return @quality = 0 if @sell_in <= 0
      return @quality += 1 if @sell_in > 10
      return @quality += 3 if @sell_in <= 5
      return @quality += 2 if @sell_in <= 10
    end
end
