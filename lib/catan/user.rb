module Catan
  class User
    attr_reader :name, :hand, :inventory
    def initialize(name)
      @name = name
      @inventory = build_inventory
      @hand = []
    end

    def place_road(board, hexpoint, direction)
      if @inventory[:roads] > 0
        @inventory[:roads] -= 1
        board[hexpoint][:roads, direction] = Catan::Road.new self
        place_opposing_road(board, hexpoint, direction)
      else
        raise "You've already used all the roads, #{@name}"
      end
    end

    def place_settlement(board, hexpoint, direction)
      if @inventory[:settlements] > 0
        @inventory[:settlements] -= 1
        board[hexpoint][:metropoles, direction] = Catan::Metropolis.new self
      else
        raise "You've already used all the settlements, #{@name}"
      end
    end

    private

    def build_inventory
      {settlements: 5, cities: 4, roads: 15, ships: 15}
    end

    def place_opposing_road(board, hexpoint, direction)
      board.neighbor_to_the(direction, hexpoint)[:roads,
        Catan::Direction[direction].opposite] = Catan::Road.new self
    end
  end
end
