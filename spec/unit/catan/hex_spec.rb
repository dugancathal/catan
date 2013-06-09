require 'spec_helper'

describe Catan::Hex do
  it 'has 6 sides' do
    Catan::Hex.new.roads.count.must_equal 6
  end

  it 'has 6 vertices' do
    Catan::Hex.new.metropoles.count.must_equal 6
  end

  describe 'placing on a hex' do
    before(:each) do
      @user = Catan::User.new 'test'
      @board = Catan::HexGrid.new 3
      @hexpoint = Catan::HexPoint.new 1, -1
      @hex = @board[@hexpoint]
    end
    it 'knows who owns a road' do
      @user.place_road @board, @hexpoint, :northwest
      @hex.northwest_road.must_be_kind_of Catan::Road
      @hex.southwest_road.must_equal nil
    end

    it 'knows who owns a metropolis' do
      @user.place_settlement @board, @hexpoint, :west
      @hex.west_metropolis.must_be_kind_of Catan::Metropolis
      @hex.east_metropolis.must_equal nil
    end
  end
end
