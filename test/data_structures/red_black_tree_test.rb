require_relative '../../lib/data_structures/red_black_tree'
require 'minitest/autorun'

class RedBlackNodeTest < MiniTest::Test

  def test_color_field
    node = DataStructures::RedBlackNode.new(5, 'value')
    assert(node.red?)
    refute(false, node.black?)
  end

  def test_changing_color
    node = DataStructures::RedBlackNode.new(5, 'value')
    node.turn_black!
    assert(node.black?)
    node.turn_red!
    assert(node.red?)
  end

end
class RedBlackTreeTest < MiniTest::Test

  def test_root_node_is_black
    rb = DataStructures::RedBlackTree.new
    rb.insert(50, 'hello')
    assert(rb.root.black?)
  end

  def test_inserting_two_red_nodes
    rb = DataStructures::RedBlackTree.new
    rb.insert(50, 'val1')
    rb.insert(25, 'val2')
    rb.insert(75, 'val3')
    assert(rb.root.right_child.red?)
    assert(rb.root.left_child.red?)
  end

  def test_simple_black_height_rule
    rb = DataStructures::RedBlackTree.new
    rb.insert(50, 'val1')
    rb.insert(25, 'val2')
    rb.insert(75, 'val3')
    rb.insert(12, 'val4')
    assert(rb.root.left_child.black?)
    assert(rb.root.right_child.black?)
  end
end
