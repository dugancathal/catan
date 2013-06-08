module Catan
  class User
    attr_reader :name
    def initialize(name)
      @name = name
    end

    def place_road(hex, side)
      hex[side] = self
    end
  end
end
