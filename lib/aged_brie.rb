require_relative 'regular_item'

class AgedBrie < RegularItem

  def initialize(name, sell_in, quality)
    @name = 'Aged Brie'
    @sell_in = sell_in
    @quality = quality
  end

  protected
    def update_quality
      @quality += 1 if @quality < 50
    end
end
