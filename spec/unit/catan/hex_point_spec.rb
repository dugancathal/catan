require 'spec_helper'

describe Catan::HexPoint do
  it 'describes a point in "hex space"' do
  end

  it 'has three axes: x + y + z = 0' do
    point = Catan::HexPoint.new 0, 0
    point.z.must_equal 0
  end
end
