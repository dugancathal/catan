require 'spec_helper'

describe Catan::User do
  before do
    @username = 'test'
    @user = Catan::User.new @username
    @board = Catan::HexGrid.new 3
    @hexpoint = Catan::HexPoint.new 0, 0
  end

  it 'has a name' do
    @user.name.must_equal @username
  end

  it 'has an inventory' do
    @user.inventory.must_be_kind_of Hash
  end

  describe '#inventory' do
    it 'starts with default amounts' do
      @user.inventory[:settlements].must_equal 5
      @user.inventory[:cities].must_equal 4
      @user.inventory[:roads].must_equal 15
      @user.inventory[:ships].must_equal 15
    end

    it 'diminishes with roads with use' do
      num_roads = @user.inventory[:roads]
      @user.place_road @board, @hexpoint, :north
      @user.inventory[:roads].must_equal(num_roads - 1)
    end
    
    it 'diminishes with settlements with use' do
      num_settlements = @user.inventory[:settlements]
      @user.place_settlement @board, @hexpoint, :west
      @user.inventory[:settlements].must_equal(num_settlements - 1)
    end
  end

  describe '#resource_hand' do
    it 'is an array' do
      @user.hand.must_be_kind_of Array
    end

    it 'starts empty' do
      @user.hand.must_equal []
    end
  end
end
