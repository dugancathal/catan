require 'spec_helper'

describe Catan::Hex do
  it 'has 6 sides' do
    Catan::Hex.new.roads.count.must_equal 6
  end

  it 'has 6 vertices' do
    Catan::Hex.new.metropoles.count.must_equal 6
  end

  it 'knows who owns a side' do
    user = Catan::User.new 'test'
    hex = Catan::Hex.new
    user.place_road hex, :nw
    hex.northwest_road.must_equal user
    hex.southwest_road.must_equal nil
  end

  it 'knows who owns a vertex' do
    user = Catan::User.new 'test'
    hex = Catan::Hex.new
    user.place_metropolis hex, :w
    hex.west_metropolis.must_equal user
    hex.east_metropolis.must_equal nil
  end
end
