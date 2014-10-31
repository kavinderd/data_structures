require_relative "../../lib/data_structures/two_three_four_tree"
require "minitest/autorun"

class TwoThreeFourNodeTest < Minitest::Test

  def test_keys_array_is_empty_at_init
    node = DataStructures::TwoThreeFourNode.new
    assert([], node.keys)
  end

  def test_inserting_key
    node = DataStructures::TwoThreeFourNode.new
    node.insert(10)
    assert_equal([10], node.keys)
    assert_equal(1, node.count)
    node.insert(5)
    assert_equal([5,10], node.keys)
    assert_equal(2, node.count)
    node.insert(6)
  end

  def test_removing_key
    node = DataStructures::TwoThreeFourNode.new
    node.insert(10)
    node.insert(5)
    node.insert(16)
    assert_equal([5,10, 16], node.keys)
    node.remove
    assert_equal([5,10], node.keys)
  end

  def test_finding_key
    node = DataStructures::TwoThreeFourNode.new
    node.insert(10)
    node.insert(5)
    node.insert(16)
    assert_equal(1, node.find(10))
    refute(node.find(45))
  end

  def test_it_knows_when_its_full
    node = DataStructures::TwoThreeFourNode.new
    node.insert(10)
    node.insert(5)
    refute(node.full?)
    node.insert(20)
    assert(node.full?)
  end

  def test_adding_children
    node = DataStructures::TwoThreeFourNode.new
    node.insert(10)
    child = DataStructures::TwoThreeFourNode.new
    node.add_child(0,child)
    assert_equal([child], node.children)
    node.add_child(1, child)
    assert_equal([child, child], node.children)
  end

  def test_removing_children
    node = DataStructures::TwoThreeFourNode.new
    node.insert(10)
    child = DataStructures::TwoThreeFourNode.new
    node.add_child(0,child)
    assert_equal(child, node.remove_child(0))
    assert_equal([], node.children)
  end

  def test_leaf_status
    node = DataStructures::TwoThreeFourNode.new
    assert(node.leaf?)
    child = DataStructures::TwoThreeFourNode.new
    node.add_child(0,child)
    refute(node.leaf?)
  end


end
class TwoThreeFourTreeTest < Minitest::Test

  def test_initial_root
    tree = DataStructures::TwoThreeFourTree.new
    assert(tree.root)
  end

  def test_inserting_to_non_full_root
    tree = DataStructures::TwoThreeFourTree.new
    tree.insert(10)
    assert_equal([10], tree.root.keys)
  end

  def test_inserting_to_full_root
    tree = DataStructures::TwoThreeFourTree.new
    tree.insert(10)
    tree.insert(11)
    tree.insert(12)
    tree.insert(9)
    assert_equal([11], tree.root.keys)
    assert_equal(2, tree.root.children.count)
  end

  def test_finding_a_key
    tree = DataStructures::TwoThreeFourTree.new
    tree.insert(10)
    tree.insert(11)
    tree.insert(12)
    tree.insert(9)
    refute(tree.find(24))
    assert_equal(0, tree.find(12))
    assert_equal(1, tree.find(10))
  end


end
