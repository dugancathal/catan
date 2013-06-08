module Catan
  class Hex
    attr_reader :sides
    SIDE_NAMES = %w(north northeast southeast south southwest northwest)
    DIRECTIONS_TO_SIDES = {
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

    def initialize
      @sides = Array.new(6)
    end

    def []=(side, value)
      @sides[DIRECTIONS_TO_SIDES[side]] = value
    end

    def [](side)
      @sides[DIRECTIONS_TO_SIDES[side]]
    end

    SIDE_NAMES.each do |side_name|
      define_method side_name do
        self[side_name.to_sym]
      end
    end
  end
end
