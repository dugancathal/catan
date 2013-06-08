require 'spec_helper'

describe Catan::Hex do
  it 'has 6 sides' do
    Catan::Hex.new.sides.count.must_equal 6
  end

  it 'knows who owns a side' do
    user = Catan::User.new :test
    hex = Catan::Hex.new
    user.place_road hex, :nw
    hex.northwest.must_equal user
    hex.southwest.must_equal nil
  end
end
