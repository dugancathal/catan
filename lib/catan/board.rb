module Catan
  class Board
    attr_reader :graph, :grid
    def initialize(grid)
      @grid = grid
      build_graph
    end

    private

    def build_graph
      @graph = Graph.new
      @grid.each do |point, hex|
        %i(west east).each do |dir|
          @graph.add_vertex point, Direction[dir]
        end
        %i(west north east).each do |dir|
          @graph.add_edge point, Direction[dir]
        end
      end
    end
  end
end
