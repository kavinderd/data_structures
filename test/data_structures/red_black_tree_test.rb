require_relative '../../lib/data_structures/red_black_tree'
require 'minitest/autorun'
require 'pry'
require 'pry-debugger'

class RedBlackNodeTest < MiniTest::Test

  def test_red_by_default
    node = DataStructures::RedBlackNode.new(1)
    assert(node.red?)
  end

  def test_nil_family_by_default
    node = DataStructures::RedBlackNode.new(1)
    refute(node.parent)
    refute(node.left_child)
    refute(node.right_child)
  end

  def test_getting_child_with_dir
    node = DataStructures::RedBlackNode.new(1)
    rchild = DataStructures::RedBlackNode.new(3)
    lchild = DataStructures::RedBlackNode.new(5)
    node.set_child(:left, lchild)
    node.set_child(:right, rchild)
    assert_equal(node.get_child(:right), node.right_child)
    assert_equal(node.get_child(:left), node.left_child)
  end


  def test_parent_link
    child = DataStructures::RedBlackNode.new(1)
    parent = DataStructures::RedBlackNode.new(5)
    child.parent = parent
    assert_equal(5, child.parent.key)
  end

  def test_grandparent_link
    child = DataStructures::RedBlackNode.new(1)
    parent = DataStructures::RedBlackNode.new(5)
    grandparent = DataStructures::RedBlackNode.new(10)
    child.parent = parent
    parent.parent = grandparent
    assert_equal(10, child.grandparent.key)
  end

  def test_node_sidedness
    child = DataStructures::RedBlackNode.new(1)
    parent = DataStructures::RedBlackNode.new(5)
    parent.right_child = child
    child.parent = parent
    assert(child.is_right_child?)
    refute(child.is_left_child?)
  end

  def test_uncle_link
    child = DataStructures::RedBlackNode.new(1)
    parent = DataStructures::RedBlackNode.new(5)
    grandparent = DataStructures::RedBlackNode.new(10)
    uncle = DataStructures::RedBlackNode.new(15) 
    grandparent.left_child = parent and parent.parent = grandparent
    grandparent.right_child = uncle and uncle.parent = grandparent
    child.parent = parent
    assert_equal(15, child.right_uncle.key)
    refute(child.left_uncle)
  end


end

class RedBlackTreeTest < MiniTest::Test

  def setup
    @rbtree = DataStructures::RedBlackTree.new
  end

  def test_nil_root_at_initialization
    refute(@rbtree.root) 
  end

  def test_inserting_root_node
    @rbtree.insert(45)
    assert_equal(45, @rbtree.root.key)
    assert(@rbtree.root.black?)
  end

  def test_insert_red_child_to_black_node
    @rbtree.insert(50)
    @rbtree.insert(55)
    @rbtree.insert(45)
    assert(@rbtree.root.left_child.red?)
    assert(@rbtree.root.right_child.red?)
  end

  def test_balance_when_inserting_red_child_inside_no_uncle
    @rbtree.insert(1)
    @rbtree.insert(7)
    @rbtree.insert(3)
    assert_equal(3, @rbtree.root.key)
    assert_equal(1, @rbtree.root.left_child.key)
    assert_equal(7, @rbtree.root.right_child.key)
  end

  def test_balance_when_inserting_red_child_outside_no_uncle
    @rbtree.insert 1
    @rbtree.insert 7
    @rbtree.insert 8
    assert_equal(7, @rbtree.root.key)
    assert_equal(1, @rbtree.root.left_child.key)
    assert_equal(8, @rbtree.root.right_child.key)
  end

  def test_balance_when_inserting_red_child_to_red_parent_opposite_of_uncle
    @rbtree.insert 3
    @rbtree.insert 1
    @rbtree.insert 7

    @rbtree.insert 8
    assert_equal(3, @rbtree.root.key)
    assert(@rbtree.root.right_child.black?)
    assert(@rbtree.root.left_child.black?)
    assert(@rbtree.root.right_child.right_child.red?)
  end

 
end
