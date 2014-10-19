require_relative '../../lib/algorithms/sortable'
require 'minitest/autorun'

class SortableTest < MiniTest::Test

  def test_bubble_sort
    ar = [1,3,53,5,21,6]
    ar =Algorithms::Sortable.bubble_sort(ar)
    assert_equal([1,3,5,6,21,53], ar)
  end

  def test_selection_sort
    ar = [1,3,53,5,21,6]
    ar =Algorithms::Sortable.selection_sort(ar)
    assert_equal([1,3,5,6,21,53], ar)
  end

  def test_insertion_sort
    ar = [1,3,53,5,21,6]
    ar =Algorithms::Sortable.insertion_sort(ar)
    assert_equal([1,3,5,6,21,53], ar)
  end

  def test_odd_even_sort
    ar = [1,3,53,5,21,6]
    ar =Algorithms::Sortable.odd_even_sort(ar)
    assert_equal([1,3,5,6,21,53], ar)
  end

  def test_mergesort
    ar = [1,3,53,5,21,6]
    ar =Algorithms::Sortable.mergesort(ar)
    assert_equal([1,3,5,6,21,53], ar)
  end
  
end
