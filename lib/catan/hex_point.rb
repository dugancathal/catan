require 'matrix'

module Catan
  class HexPoint
    include Comparable
    DIRECTIONS_IN_CUBE_COORDS = {
      north: [0, 1, -1],
      northeast: [1, 0, -1],
      southeast: [1, -1, 0],
      south: [0, -1, 1],
      southwest: [-1, 0, 1],
      northwest: [-1, 1, 0],
    }

    attr_reader :x, :y
    def initialize(x, y)
      @x, @y = x, y
    end

    def z
      @z ||= 0 - x - y
    end

    def travel(direction)
      directions = DIRECTIONS_IN_CUBE_COORDS[direction]
      HexPoint.new x + directions[0], y + directions[1]
    end

    def <=>(other)
      x <=> other.x && y <=> other.y
    end

    def hash
      [x, y, z].hash
    end

    def eql?(other)
      self == other
    end
  end
end
