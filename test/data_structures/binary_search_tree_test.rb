require_relative '../../lib/data_structures/binary_search_tree'
require 'minitest/autorun'

class NodeTest < MiniTest::Test
  
  def test_empty_node
    n = DataStructures::Node.new
    assert_equal(nil, n.value)
    assert_equal(nil, n.key)
  end

end

class BinarySearchTreeTest < MiniTest::Test

end
