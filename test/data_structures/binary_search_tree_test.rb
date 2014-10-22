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

end
