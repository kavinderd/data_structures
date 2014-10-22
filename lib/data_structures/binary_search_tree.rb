module DataStructures
  class Node

    attr_reader :key, :value
    attr_accessor :right_child, :left_child
    def initialize(key, value)
      @key = key
      @value = value
    end

  end

  class Tree

    attr_reader :root
    def initialize
      @root = nil
    end

    def insert(key, value)
      node = Node.new(key, value)
      if @root
        current = @root
        parent = nil
        loop do
          parent = current
          if key < current.key
            current = current.left_child
            unless current
              parent.left_child = newNode
              break
            end
          else
            current = current.right_child
            unless currnet
              parent.right_child = node
              break
            end
          end
        end
      else
        @root = node
      end
    end
  end
end
