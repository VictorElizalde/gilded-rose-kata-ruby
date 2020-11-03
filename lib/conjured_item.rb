require_relative 'regular_item'

class ConjuredItem < RegularItem
  protected
    def update_quality
      @quality -= 2
    end
end
