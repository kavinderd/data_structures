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

    def find(key)
      current = @root
      while current.key != key
        if key < current.key
          current = current.left_child
        else
          current = current.right_child
        end
        break unless current
      end
      current
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
        @root = node
      end
    end

    def delete(key)
      return nil unless @root
      current = @root
      parent = @root
      is_left =true
      while current.key != key
        parent = current
        if key < current.left_child.key
          is_left = true
          current = current.left_child
        else
          is_left = false
          current = current.right_child
        end
        break unless current
      end
      if !current.left_child && !current.right_child
        delete_node_without_children(current, parent, is_left)
      elsif !current.right_child
        delete_node_with_left_child(current, parent, is_left)
      elsif !current.left_child
        delete_node_with_right_child(current, parent, is_left)
      else
        delete_node_with_two_children(current, parent, is_left)
      end
    end

    def traverse(type)
      result = []
      case type
      when :preorder
        preorder(@root, result)
      when :inorder
        inorder(@root, result)
      when :postorder
        postorder(@root, result)
      end
      result
    end

    private

    def preorder(node, result)
      return unless node
      result << node.value
      preorder(node.left_child, result)
      preorder(node.right_child, result)
    end

    def inorder(node, result)
      return unless node
      inorder(node.left_child, result)
      result << node.value
      inorder(node.right_child, result)
    end

    def postorder(node, result)
      return unless node
      postorder(node.left_child, result)
      postorder(node.right_child,result)
      result << node.value
    end 

    def get_successor(node)
      successor_parent = node
      successor = node
      current = node.right_child
      while current
        successor_parent = successor
        successor = current
        current = current.left_child
      end
      if successor != node.right_child
        successor_parent.left_child = successor.right_child
        successor.right_child = node.right_child
      end
      successor
    end

    def delete_node_without_children(current, parent, is_left)
      if current == @root
        root = nil
      elsif is_left
        parent.left_child = nil
      else
        parent.right_child = nil
      end
    end

    def delete_node_with_left_child(current, parent, is_left)
      if current == @root
        root = current.left_child
      elsif is_left
        parent.left_child = current.left_child
      else
        parent.right_child  = current.left_child
      end
    end

    def delete_node_with_right_child(current, parent, is_left)
      if current == @root
        root = current.right_child
      elsif is_left
        parent.left_child = current.right_child
      else
        parent.right_child = current.right_child
      end
    end

    def delete_node_with_two_children(current, parent, is_left)
      successor = get_successor(current)
      if current == @root
        @root = successor
      elsif is_left
        parent.left_child = successor
      else
        parent.right_child = successor
      end
      successor.left_child = current.left_child
    end

  end
end
