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

  def test_shellsort
    ar = [1,3,53,5,21,6]
    ar =Algorithms::Sortable.shellsort(ar)
    assert_equal([1,3,5,6,21,53], ar)
  end

  def test_partition
    ar = [149, 192, 47,152, 159, 195, 61, 66, 17, 167, 118, 64, 27, 80, 30, 105]
    ar = Algorithms::Sortable.partition(ar, 0, ar.size-1, 99)
    assert_equal(8, ar)
  end

  def test_quicksort
    ar = [1,3,53,5,21,6]
    ar =Algorithms::Sortable.quicksort(ar, 0, ar.size - 1)
    assert_equal([1,3,5,6,21,53], ar)
  end

  def test_heapsort
    ar = [1,3,53,5,21,6]
    ar =Algorithms::Sortable.heapsort(ar)
    assert_equal([1,3,5,6,21,53], ar)
  end
end
