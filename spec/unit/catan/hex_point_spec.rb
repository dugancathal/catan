require 'spec_helper'

describe Catan::HexPoint do
  it 'describes a point in "hex space"' do
  end

  it 'has three axes: x + y + z = 0' do
    point = Catan::HexPoint.new 0, 0
    point.z.must_equal 0
  end

  it 'can travel in a given direction' do
    point = Catan::HexPoint.new 0, 0
    new_point = point.travel(:northeast)
    new_point.x.must_equal 1
    new_point.y.must_equal 0
    new_point.z.must_equal -1
  end

  it 'is equal if all the coords are the same' do
    point = Catan::HexPoint.new 0, 0
    other = Catan::HexPoint.new 0, 0
    point.must_equal other
  end
end
