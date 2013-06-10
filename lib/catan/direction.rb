module Catan
  class Direction
    OPPOSITES = {
      north: :south,
      south: :north,
      northwest: :southeast,
      northeast: :southwest,
      southwest: :northeast,
      southeast: :northwest,
      east: :west,
      west: :east,
    }

    attr_reader :direction
    def initialize(dir)
      @direction = dir.to_sym
    end

    def opposite
      self.class[OPPOSITES[@direction]]
    end

    def to_s
      @direction.to_s
    end

    def to_sym
      @direction
    end
    
    def self.[](dir)
      @@directions[dir]
    end

    @@directions = {}
    %w(north northeast east southeast south southwest west northwest).each do |dir|
      @@directions[dir.to_sym] = Direction.new(dir)
    end
    @@directions.freeze
  end
end
