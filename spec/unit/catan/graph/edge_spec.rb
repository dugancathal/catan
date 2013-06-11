require 'spec_helper'

describe Catan::Graph::Edge do
  it 'has a point and name' do
    point = Catan::HexPoint.new(1, 2)
    Catan::Graph::Edge.new(point, Catan::Direction[:west]).point.must_equal point
    Catan::Graph::Edge.new(point, Catan::Direction[:west]).name.must_equal Catan::Direction[:west]
  end

  it 'possibly has "baggage"' do
    Catan::Graph::Edge.new(nil, nil, Object.new).weight.must_be_kind_of Object
    Catan::Graph::Edge.new(nil, nil).weight.must_equal nil
  end

  it "knows its endpoints" do
    edge = Catan::Graph::Edge.new(Catan::HexPoint.new(0, 0), Direction[:west])
    edge.endpoints.count.must_equal 2
    edge.endpoints.must_include Catan::Graph::Node.new(Catan::HexPoint.new(0, 0), Direction[:west])
    edge.endpoints.must_include Catan::Graph::Node.new(Catan::HexPoint.new(-1, 1), Direction[:east])
  end

  it 'knows if it is connected to another edge' do
    edge1 = Catan::Graph::Edge.new(Catan::HexPoint.new(0, 0), Direction[:west])
    edge2 = Catan::Graph::Edge.new(Catan::HexPoint.new(0, 0), Direction[:north])
    edge3 = Catan::Graph::Edge.new(Catan::HexPoint.new(0, 0), Direction[:east])
    edge1.connected_to?(edge2).must_equal true
    edge1.connected_to?(edge3).must_equal false
  end
end
