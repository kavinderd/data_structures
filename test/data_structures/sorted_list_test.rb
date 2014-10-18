require_relative '../../lib/data_structures/sorted_list'
require 'minitest/autorun'

class SortedListTest < MiniTest::Test
  
  def test_inserting_items_out_of_order
    l = DataStructures::SortedList.new
    l << 35
    l << 20
    l << 100
    l << 5
    assert_equal(5, l.current)
    assert_equal(20, l.next)
    assert_equal(35, l.next)
    assert_equal(100, l.next)
  end
end
