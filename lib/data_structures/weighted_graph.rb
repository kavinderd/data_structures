require 'pry'
require 'pry-debugger'
module DataStructures
  class Edge
    attr_reader :distance, :from, :to
    def initialize(from, to, distance)
      @from = from
      @to = to
      @distance = distance
    end
  end

  class PriorityQ

    attr_reader :count
    def initialize
      @queue = []
      @count = 0
    end

    def insert(edge)
      index = 0
      0.upto(@count - 1) do |i|
        if edge.distance >= @queue[index].distance
          break
        end
        index += 1
      end
      (@count - 1).downto(index) do |i|
        @queue[i+1] = @queue[i]
      end
      @queue[index] = edge
      @count += 1
    end

    def remove_min
      @count -= 1
      result = @queue.delete_at(@count)
    end

    def remove_at(index)
      index.upto(@count-1) do |i|
        @queue[i] = @queue[i+1]
        @count -= 1
      end
    end

    def peek_min
      @queue[@count-1]
    end

    def empty?
      @count == 0
    end
    
    def peek_at(index)
      @queue[index]
    end

    def find(value)
      0.upto(@count-1) do |i|
        if @queue[i].to == value
          return i
        end
      end
      nil
    end
  end

  class Vertex

    attr_accessor :is_in_tree, :name
    def initialize(name)
      @name= name
      @is_in_tree = false
    end
  end

  class WeightedGraph
    MAX_VERTS = 20
    INFINITY = 1000000

    def initialize
      @vertices = []
      @matrix = Array.new(MAX_VERTS) { Array.new(MAX_VERTS, INFINITY) }
      @count = 0
      @pq = PriorityQ.new
    end  

    def add_vertex(name)
      @vertices << Vertex.new(name)
      @count += 1
    end

    def add_edge(from, to, weight)
      @matrix[from][to] = weight
      @matrix[to][from] = weight
    end

    def minimum_spanning_tree
      current = 0
      tree_count = 0
      result = []
      while(tree_count < @count - 1)
        @vertices[current].is_in_tree = true
        tree_count += 1

        0.upto(@count - 1) do |i|
          if i == current
            next
          end
          if @vertices[i].is_in_tree
            next
          end
          distance  = @matrix[current][i]
          if distance == INFINITY
            next
          end
          put_in_pq(current,i, distance)
        end
        if @pq.count == 0
          puts "GRAPH NOT CONNECTED"
          return
        end
        edge = @pq.remove_min
        current = edge.to
        source = @vertices[edge.from]
        dest = @vertices[edge.to]
        result << "#{source.name}#{dest.name}"
      end
      0.upto(@count - 1) do |i|
        @vertices[i].is_in_tree = false
      end
      result
    end

    def put_in_pq(current, vert, dist)
      queue_index = @pq.find(vert)
      if queue_index
        temp = @pq.peek_at(queue_index)
        old_dist = temp.distance
        if old_dist > dist
          @pq.remove_at(queue_index)
          edge = Edge.new(current, vert, dist)
          @pq.insert(edge)
        end
      else
        edge = Edge.new(current, vert, dist)
        @pq.insert(edge)
      end
    end
  end

end
