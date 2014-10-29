module DataStructures

  class RedBlackNode 

    attr_reader :key
    attr_accessor :right_child, :left_child, :parent, :color
    def initialize(key,color=:red)
      @key = key
      @color = color
    end

    def red?
      @color == :red
    end

    def black?
      @color == :black
    end

    def flip!
      @color = red? ? :black : :red
    end

    def set_child(dir, node)
      if dir == :right
        @right_child = node
      else
        @left_child = node
      end
    end

    def get_child(dir)
      self.send("#{dir.to_s}_child")
    end

    def grandparent
      parent.parent if parent
    end
    
    def right_uncle 
      if grandparent
        grandparent.right_child unless grandparent.right_child == parent
      end
    end

    def left_uncle
      if grandparent
        grandparent.left_child unless grandparent.left_child == parent
      end
    end

    def is_right_child?
      return nil unless @parent 
      @parent.right_child == self
    end

    def is_left_child?
      return nil unless @parent
      @parent.left_child == self
    end

    def sidedness
      is_left_child? ? :left : :right
    end

  end

  class RedBlackTree

    attr_reader :root
    def initialize
      
    end

    def insert(key)
      node = RedBlackNode.new(key)
      rb_insert(node)
    end

    def rb_insert(node)
      unless @root
        @root = node
        node.flip!
        return
      end
      tree_insert(node)
      until node == @root || node.parent.color == :black
        uncle = node.parent.is_left_child? ? node.right_uncle : node.left_uncle
        node = cases(node, uncle)
        @root.color = :black
      end
    end

    def tree_insert(node, root=@root)
      dir = node.key < root.key ? :left : :right
      if root.get_child(dir)
        tree_insert(node, root.get_child(dir))
      else
        root.set_child(dir, node)
        node.parent = root
      end
    end

    def cases(node, uncle)
      if uncle.nil? || uncle.color == :black
        black_uncle(node, uncle)
      else
        recolor(node, uncle)
      end
    end

    def black_uncle(node, uncle)
      if node.sidedness != node.parent.sidedness
        node = node.parent
        rotate(node, node.sidedness)
      end
      node.parent.color = :black
      node.grandparent.color = :red
      opp_dir = node.is_left_child? ? :right : :left
      rotate(node.grandparent, opp_dir)
      node.grandparent
    end

    def recolor(node, uncle)
      node.parent.color = :black
      uncle.color = :black
      node.grandparent.color = :red
      node = node.grandparent
      node
    end

    def rotate(parent, dir1)
      dir2 = dir1 == :left ? :right : :left
      child = parent.get_child(dir2)
      parent.set_child(dir2, child.get_child(dir1))
      child.get_child(dir1).parent = parent unless child.get_child(dir1).nil?
      if parent == @root
        @root = child
      else
        child.parent = parent.parent
        parent.parent.set_child(parent.sidedness, child)
      end
      parent.parent = child
      child.set_child(dir1, parent)
    end
    
  end
end
