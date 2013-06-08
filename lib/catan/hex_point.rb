module Catan
  class HexPoint
    attr_reader :x, :y
    def initialize(x, y)
      @x, @y = x, y
    end

    def z
      @z ||= 0 - x - y
    end
  end
end
