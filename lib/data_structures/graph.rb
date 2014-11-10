require 'pry'
require 'pry-debugger'
module DataStructures
  class Vertex
    
    attr_reader :value
    attr_accessor :visited
    def initialize(value)
      @value = value
      @visited = false
    end

  end

  class Graph

    MAX_VERTS = 20

    attr_reader :count
    def initialize
      @stack = []
      @vertices = []
      @count = 0
      @matrix = Array.new(MAX_VERTS) {Array.new(MAX_VERTS,0)}
    end

    def add_vertex(value)
      @vertices[count] = Vertex.new(value)
      @count += 1
    end

    def add_edge(from, to)
      @matrix[from][to] = 1
      @matrix[to][from] = 1
    end

    def at_index(index)
      @vertices[index].value
    end

    def breadth_first_search
      @queue = []
      @vertices[0].visited = true
      result  = [@vertices[0].value]
      @queue << 0
      while @queue.any?
        index = @queue.shift
        while index2 = adj_unvisited_vertex(index)
          @vertices[index2].visited = true
          result << @vertices[index2].value
          @queue << index2
        end
      end
      0.upto(count-1) do |i|
        @vertices[i].visited = false
      end
      result.join
    end

    def depth_first_search
      @vertices[0].visited = true
      result = [@vertices[0].value]
      @stack.push(0)
      while @stack.any?
        index = adj_unvisited_vertex(@stack.last)
        if index
          @vertices[index].visited = true
          result << @vertices[index].value
          @stack.push(index)
        else
          @stack.pop
        end
      end
      0.upto(@count-1) do |i|
        @vertices[i].visited = false
      end
      result.join
    end

    private

    def adj_unvisited_vertex(index)
      0.upto(@count-1) do |i|
        if @matrix[index][i] == 1 && @vertices[i].visited == false
          return i
        end
      end 
      nil
    end
  end
end
