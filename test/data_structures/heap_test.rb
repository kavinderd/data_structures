require_relative "../../lib/data_structures/heap"
require "minitest/autorun"

class HeapTest < MiniTest::Test
  
  def test_new_heap_has_0_size
    h = DataStructures::Heap.new
    assert_equal(0, h.size)
  end

  def test_retrieving_root
    h = DataStructures::Heap.new
    h.insert(50)
    assert_equal(50, h.remove.key)
  end

  def test_inserting_multiple_values
    h = DataStructures::Heap.new
    h.insert(50)
    h.insert(75)
    h.insert(60)
    assert_equal(75, h.remove.key)
    assert_equal(60, h.remove.key)
    assert_equal(50, h.remove.key)
  end

end
