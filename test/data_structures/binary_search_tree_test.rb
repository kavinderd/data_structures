require_relative '../../lib/data_structures/binary_search_tree'
require 'minitest/autorun'

class NodeTest < MiniTest::Test
  
  def test_new_node
    n = DataStructures::Node.new(0, 'hello')
    assert_equal('hello', n.value)
    assert_equal(0, n.key)
  end

  def test_node_right_child
    n = DataStructures::Node.new(0, 'hello')
    rn = DataStructures::Node.new(1, 'bye')
    n.right_child = rn
    assert_equal(rn, n.right_child)
  end

end

class TreeTest < MiniTest::Test

  def test_inserting
    t = DataStructures::Tree.new
    t.insert(10, 'hello')
    assert_equal('hello', t.root.value)
  end

  def test_finding
    t = DataStructures::Tree.new
    t.insert(10, 'hello')
    t.insert(32, 'farewell')
    t.insert(1, 'good day')
    t.insert(16, 'adios')
    assert_equal('good day', t.find(1).value)
  end

  def test_deletion_node_without_children
    t = DataStructures::Tree.new
    t.insert(10, 'hello')
    t.insert(32, 'farewell')
    t.insert(1, 'good day')
    t.insert(16, 'adios')
    t.delete(32)
    assert_equal(nil, t.find(32))
  end

  def test_deletion_node_with_right_child
    t = DataStructures::Tree.new
    t.insert(10, 'hello')
    t.insert(32, 'farewell')
    t.insert(1, 'good day')
    t.insert(16, 'adios')
    t.insert(35, 'hi')
    t.delete(32)
    assert_equal(nil, t.find(32))
    assert_equal('hi', t.find(35).value)
  end

  def test_deletion_node_with_left_child
    t = DataStructures::Tree.new
    t.insert(10, 'hello')
    t.insert(32, 'farewell')
    t.insert(1, 'good day')
    t.insert(16, 'adios')
    t.insert(31, 'hi')
    t.delete(32)
    assert_equal(nil, t.find(32))
    assert_equal('hi', t.find(31).value)
  end

  def test_deletion_node_with_left_child
    t = DataStructures::Tree.new
    t.insert(10, 'hello')
    t.insert(32, 'farewell')
    t.insert(1, 'good day')
    t.insert(16, 'adios')
    t.insert(31, 'hi')
    t.insert(33, 'sup')
    t.delete(32)
    assert_equal(nil, t.find(32))
    assert_equal('hi', t.find(31).value)
    assert_equal('sup', t.find(33).value)
  end

  def test_preorder_traversal
    t = DataStructures::Tree.new
    t.insert(10, '*')
    t.insert(5, 'A')
    t.insert(12, '+')
    t.insert(11, 'B')
    t.insert(13, 'C')
    preorder = t.traverse(:preorder)
    assert_equal(%w{ * A + B C }, preorder)
  end

  def test_inorder_traversal
    t = DataStructures::Tree.new
    t.insert(10, '*')
    t.insert(5, 'A')
    t.insert(12, '+')
    t.insert(11, 'B')
    t.insert(13, 'C')
    inorder = t.traverse(:inorder)
    assert_equal(%w{ A * B + C} , inorder)
  end

  def test_postorder_traversal
    t = DataStructures::Tree.new
    t.insert(10, '*')
    t.insert(5, 'A')
    t.insert(12, '+')
    t.insert(11, 'B')
    t.insert(13, 'C')
    postorder = t.traverse(:postorder)
    assert_equal(%w{ A B C + * }, postorder)
  end

end
