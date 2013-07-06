require 'set'

module Catan
  class Graph
    attr_reader :vertices, :edges
    def initialize
      @vertices = []
      @edges = []
    end

    def add_vertex(point, name)
      @vertices << Node.new(point, name)
    end

    def add_edge(point, name, weight = nil)
      add_vertex(point, name)
      @edges << Edge.new(point, name, weight)
    end

    def longest_path_length(user)
      
    end

    class Edge
      attr_reader :point, :name
      attr_accessor :weight
      def initialize(point, name, w = nil)
        @point, @name, @weight = point, name, w
      end

      def eql?(other)
        @point == other.point && @name == other.name
      end

      def ==(other)
        self.eql? other
      end

      def to_s
        "(#{endpoints.first} ==== #{endpoints.last})"
      end

      def hash
        [point.x, point.y, name].hash
      end

      def endpoints
        case name
        when Direction[:west]
          [Node.new(@point, Direction[:west]), Node.new(@point.travel(:northwest), Direction[:east])]
        when Direction[:north]
          [Node.new(@point.travel(:northwest), Direction[:east]), Node.new(@point.travel(:northeast), Direction[:west])]
        when Direction[:east]
          [Node.new(@point.travel(:northeast), Direction[:west]), Node.new(@point, Direction[:east])]
        end
      end

      def connection(other)
        (endpoints & other.endpoints).first
      end
    end

    class Node
      attr_reader :point, :name
      def initialize(v, d)
        @point = v
        @name = d
      end

      def eql?(other)
        @point == other.point && @name == other.name
      end

      def ==(other)
        self.eql? other
      end

      def hash
        [point.x, point.y, name].hash
      end

      def to_s
        "<#{point}, #{name}>"
      end

      def edges
        [
          Edge.new(@point, @name),
          Edge.new(@point.travel("south#{@name}".to_sym), Direction[:north]),
          Edge.new(@point.travel("south#{@name}".to_sym), @name.opposite),
        ]
      end
    end
  end
end
