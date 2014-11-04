require 'pry'
require 'pry-debugger'
module DataStructures
  class Node

    attr_reader :key
    def initialize(key)
      @key = key
    end
    
  end
  class Heap

    def initialize
      @current_size = 0
      @heap = []
    end

    def insert(key)
      node = Node.new(key)
      @heap[@current_size] = node
      trickle_up(@current_size)
      @current_size += 1
    end

    def remove
      root = @heap[0]
      @current_size -= 1
      @heap[0] = @heap[@current_size]
      trickle_down(0)
      root
    end

    def size
      @current_size
    end

    private

    def trickle_up(index)
      parent = (index-1) / 2 
      bottom = @heap[index]
      while index > 0 && @heap[parent] && @heap[parent].key < bottom.key
        @heap[index] = @heap[parent]
        index = parent
        parent = (parent - 1) / 2
      end
      @heap[index] = bottom
    end

    def trickle_down(index)
      top = @heap[index]
      while index < @current_size / 2
        left_child= 2 * index + 1
        right_child = left_child + 1
        if right_child < @current_size && @heap[left_child].key < @heap[right_child].key
          larger_child = right_child
        else
          larger_child = left_child
        end
        
        if top.key >= @heap[larger_child].key
          break
        end

        @heap[index] = @heap[larger_child]
        index = larger_child
      end
      @heap[index] = top
    end
  end
end
