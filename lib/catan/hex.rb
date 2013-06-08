module Catan
  class Hex
    attr_reader :roads
    attr_reader :metropoles
    ROAD_NAMES = %w(north northeast southeast south southwest northwest)
    DIRECTIONS_TO_ROADS = {
      :n => 0,
      :north => 0,
      :ne => 1,
      :northeast => 1,
      :se => 2,
      :southeast => 2,
      :s => 3,
      :south => 3,
      :sw => 4,
      :southwest => 4,
      :nw => 5,
      :northwest => 5,
    }

    METROPOLIS_NAMES = %w(northeast east southeast southwest west northwest)
    DIRECTIONS_TO_METROPOLES = {
      :ne => 0,
      :northeast => 0,
      :e => 1,
      :east => 1,
      :se => 2,
      :southeast => 2,
      :sw => 3,
      :southwest => 3,
      :w => 4,
      :west => 4,
      :nw => 5,
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
