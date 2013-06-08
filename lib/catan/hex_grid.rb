module Catan
  class HexGrid

    attr_reader :grid
    def initialize(radius = 2)
      @radius = radius
      @grid = {}
      (-@radius).upto(@radius) do |i|
        (-@radius).upto(@radius) do |j|
          next if (i+j).abs > @radius
          @grid[HexPoint.new(i, j)] = Hex.new
        end
      end
    end

    def neighbor_to_the(direction, point)
      @grid[point.travel(direction)]
    end

    def [](point)
      if @grid.has_key? point
        @grid[point]
      else
        raise Catan::OutOfGridException
      end
    end
  end

  class OutOfGridException < RuntimeError
  end
end
