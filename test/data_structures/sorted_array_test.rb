require_relative '../../lib/data_structures/sorted_array'
require 'minitest/autorun'

class SortedArray < MiniTest::Test
  
  def test_array(size=5)
    DataStructures::SortedArray.new(size)
  end

  def test_array_stays_sorted_on_insert
    ar = test_array(5)
    ar << 43
    ar << 32
    ar << 1
    assert_equal(1, ar[0])
    assert_equal(32, ar[1])
    assert_equal(43, ar[2])
  end

  def test_find_method
    ar = test_array(5)
    ar << 32
    ar << 31
    ar << 45
    ar << 2
    ar << 93
    assert_equal(1, ar.find(31))
  end
end
