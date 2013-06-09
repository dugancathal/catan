module Catan
  class User
    attr_reader :name, :hand, :inventory
    def initialize(name)
      @name = name
      @inventory = build_inventory
      @hand = []
    end

    def place_road(hex, direction)
      hex[:roads, direction] = self
    end

    def place_metropolis(hex, direction)
      hex[:metropoles, direction] = self
    end

    private

    def build_inventory
      {settlements: 5, cities: 4, roads: 15, ships: 15}
    end
  end
end
