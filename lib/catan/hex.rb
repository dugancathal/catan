module Catan
  class Hex
    attr_reader :roads
    attr_reader :metropoles
    ROAD_NAMES = %w(north northeast southeast south southwest northwest)
    OPPOSITE_DIRECTIONS = {
      north: :south,
      south: :north,
      northwest: :southeast,
      northeast: :southwest,
      southwest: :northeast,
      southeast: :northwest,
      east: :west,
      west: :east,
    }

    DIRECTIONS_TO_ROADS = {
      :north => 0,
      :northeast => 1,
      :southeast => 2,
      :south => 3,
      :southwest => 4,
      :northwest => 5,
    }

    METROPOLIS_NAMES = %w(northeast east southeast southwest west northwest)
    DIRECTIONS_TO_METROPOLES = {
      :northeast => 0,
      :east => 1,
      :southeast => 2,
      :southwest => 3,
      :west => 4,
      :northwest => 5,
    }

    def initialize
      @roads = Array.new(6)
      @metropoles = Array.new(6)
    end

    def [](type, direction)
      directions = self.class.const_get("DIRECTIONS_TO_#{type.upcase}")
      self.send(type)[directions[direction]]
    end

    def []=(type, direction, value)
      directions = self.class.const_get("DIRECTIONS_TO_#{type.upcase}")
      self.send(type)[directions[direction]] = value
    end

    ROAD_NAMES.each do |road_name|
      define_method "#{road_name}_road" do
        self[:roads, road_name.to_sym]
      end

      define_method "#{road_name}_road=" do |value|
        self[:roads, road_name.to_sym] = value
      end
    end

    METROPOLIS_NAMES.each do |metropolis_name|
      define_method "#{metropolis_name}_metropolis" do
        self[:metropoles, metropolis_name.to_sym]
      end

      define_method "#{metropolis_name}_metropolis=" do |value|
        self[:metropoles, metropolis_name.to_sym]
      end
    end
  end
end
