require 'pry'
require 'pry-debugger'
module DataStructures
  class TwoThreeFourNode
    ORDER = 4

    attr_reader :keys, :children
    attr_accessor :parent
    def initialize
      @keys = []
      @children = []
      @num_items = 0
    end

    def insert(key)
      @num_items += 1
      (ORDER-2).downto(0).each do |i|
        if @keys[i].nil?
        else
          current = @keys[i]
          if key < current
            @keys[i+1] = @keys[i]
          else
            @keys[i+1] = key
            return i + 1
          end
        end
      end
      @keys[0] = key
      return 0
    end

    # Note: Only Removes the last
    def remove
      key = @keys.delete_at(-1)
      @num_items -= 1
      key
    end

    def find(key)
      index = nil
      @keys.each_with_index do |k, i|
        if k == key
          index =  i
        end
      end
      index
    end

    def add_child(position, node)
      @children[position] = node
      node.parent = self if node
    end

    def remove_child(index)
      @children.delete_at(index)
    end

    def leaf?
      @children.empty?
    end

    def full?
      @num_items == ORDER - 1
    end

    def count
      @num_items
    end

  end
  class TwoThreeFourTree

    attr_reader :root
    def initialize
      @root = TwoThreeFourNode.new 
    end

    def find(key)
      current = @root
      children = 0
      found = nil
      loop do
        if current.find(key)
          break found = current.find(key)
        elsif current.leaf?
          break nil
        else
          current = next_child(current, key)
          break unless current
        end
      end
      found
    end

    def insert(key)
      current = @root
      loop do 
        if current.full?
          current = split(current)
          current = current.parent
          current = next_child(current, key)
        elsif current.leaf?
          break
        else
          current = next_child(current, key)
        end
      end
      current.insert(key)
    end

    def split(node)
      # Assuming node is full
      key_c = node.remove
      key_b = node.remove
      child2 = node.remove_child(2)
      child3 = node.remove_child(3)
      new_right_node = TwoThreeFourNode.new
      parent = nil
      if node == @root
        @root = TwoThreeFourNode.new
        parent = @root
        @root.add_child(0, node)
      else
        parent = node.parent
      end
      index = parent.insert(key_b)
      n = parent.count
      (n-1).downto(index +1 ) do |i|
        value = parent.remove_child(i)
        parent.add_child(i+1, value)
      end
      parent.add_child(index+1, new_right_node)
      new_right_node.insert(key_c)
      new_right_node.add_child(0, child2)
      new_right_node.add_child(1, child3)
      node
    end

    def next_child(node, key)
      # Assumes node is not empty, full nor a leaf
      count = node.count
      j = 0
      while j < count do
        if key < node.keys[j]
          return node.children[j]
        end
        j += 1
      end
      node.children[j]
    end
  end
end
