require 'spec_helper'

describe Catan::HexGrid do
  it 'represents a hexagonal grid' do
    Catan::HexGrid.new(2).grid.count.must_equal 19
    Catan::HexGrid.new(3).grid.count.must_equal 37
  end

  describe 'given a hexagon and a direction' do
    it "know's it's neighbors" do
      board = Catan::HexGrid.new(2)
      point = Catan::HexPoint.new(-1, 1)
      result_hex = board.grid.select {|point, hex| point.x == 0 && point.y == 0}.first.first
      neighbor = board.neighbor_to_the(:northeast, point)
      result_hex.x.must_equal 0
      result_hex.y.must_equal 0
      result_hex.z.must_equal 0
    end
  end

  it 'supports array access' do
    board = Catan::HexGrid.new(2)
    board[Catan::HexPoint.new(0, 0)].must_be_kind_of Catan::Hex
  end

  it 'throws an out of bounds exception when you try to go beyond the grid' do
    board = Catan::HexGrid.new(2)
    new_point = Catan::HexPoint.new(2, -2).travel(:northeast)
    lambda {board[new_point]}.must_raise(Catan::OutOfGridException)
  end

  it 'sets the road for both adjacent hexes' do
    board = Catan::HexGrid.new(2)
    hexpoint = Catan::HexPoint.new(1, -1)
    user = Catan::User.new 'test'
    user.place_road(board, hexpoint, :northeast)
    board[hexpoint][:roads, :northeast].must_be_kind_of Catan::Road
    board[hexpoint.travel(:northeast)][:roads, :southwest].must_be_kind_of Catan::Road
  end
end
