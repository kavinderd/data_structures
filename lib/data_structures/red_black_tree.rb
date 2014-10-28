require_relative 'binary_search_tree'
module DataStructures

  class RedBlackNode < Node

    attr_reader :color
    def initialize(key, value, color=:red)
      @color = color
      super(key, value)
    end

    def red?
      @color == :red
    end

    def black?
      @color == :black
    end

    def turn_black!
      @color = :black
    end

    def turn_red!
      @color = :red
    end

    def red_children?
      left_child.red? && right_child.red?
    end

    def black_children?
      left_child.black? && right_child.black?
    end

    def flip!
      red? ? @color = :black : @color = red
    end

  end

  class RedBlackTree < Tree

    def insert(key, value)
      node = RedBlackNode.new(key, value)
      if @root
        current = @root
        parent = nil
        grand = nil
        loop do
          grand = parent
          parent = current
          color_flip if needs_flip?(parent) && not_root(parent) # If Parent is Black and Children are Red
          if key < current.key
            current = current.left_child
            unless current
              parent.left_child = node
              break
            end
          else
            current = current.right_child
            unless current
              parent.right_child = node
              break
            end
          end
        end
      else
        node.turn_black!
        @root = node
      end
    end
  end

  private 

  def needs_flip?(node)
    node.black? && node.red_children?
  end

  def not_root(node)
    !root?(node)
  end

  def root?(node)
    node == @root
  end

  def color_flip(node)
    node.flip!
    node.left_child.flip!
    node.right_child.flip!
  end

end
