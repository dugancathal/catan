module Catan
  class User
    attr_reader :name
    def initialize(name)
      @name = name
    end

    def place_road(hex, direction)
      hex[:roads, direction] = self
    end

    def place_metropolis(hex, direction)
      hex[:metropoles, direction] = self
    end
  end
end
