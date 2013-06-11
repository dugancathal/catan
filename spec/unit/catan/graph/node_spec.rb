require 'spec_helper'

describe Catan::Graph::Node do
  it 'has a point and name' do
    point = Catan::HexPoint.new(1, 2)
    Catan::Graph::Node.new(point, Catan::Direction[:west]).point.must_equal point
    Catan::Graph::Node.new(point, Catan::Direction[:west]).name.must_equal Catan::Direction[:west]
  end

  it "knows its edges" do
    node = Catan::Graph::Node.new(Catan::HexPoint.new(0, 0), Direction[:west])
    node.edges.count.must_equal 3
    node.edges.must_include Catan::Graph::Edge.new(Catan::HexPoint.new(0, 0), Direction[:west])
    node.edges.must_include Catan::Graph::Edge.new(Catan::HexPoint.new(-1, 0), Direction[:east])
    node.edges.must_include Catan::Graph::Edge.new(Catan::HexPoint.new(-1, 0), Direction[:north])
  end
end
