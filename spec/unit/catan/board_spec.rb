require 'spec_helper'

describe Catan::Board do
  before do
    @board = Catan::Board.new(Catan::HexGrid.new(3))
  end

  it 'has a graph and grid' do
    @board.graph.must_be_kind_of Catan::Graph
    @board.grid.must_be_kind_of Catan::HexGrid
  end

  describe '#graph' do
    it 'has Nodes at the vertices' do
      node_set = @board.graph.vertices.first.must_be_kind_of Catan::Graph::Node
    end

    it 'has Edges along the edges' do
      @board.graph.edges.first.must_be_kind_of Catan::Graph::Edge
    end
  end
end
