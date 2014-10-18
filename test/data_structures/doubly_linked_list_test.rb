require_relative '../../lib/data_structures/doubly_linked_list'
require 'minitest/autorun'

class DoubleLinkTest < MiniTest::Test

  def double_link
    DataStructures::DoubleLink.new('data', next: 'next', previous: 'prev')
  end

  def test_has_next_link
    assert_equal('next', double_link.next)
  end

  def test_has_previous_link
    assert_equal('prev', double_link.previous)
  end

  def test_has_data
    assert_equal('data', double_link.data)
  end

end

class DoublyLinkedListTest < MiniTest::Test

  def test_empty_list
    dl = DataStructures::DoublyLinkedList.new
    assert_equal(nil, dl.next)
    assert_equal(nil, dl.previous)
  end

  def test_inserting
    dl = DataStructures::DoublyLinkedList.new
    dl << 45
    assert_equal(45, dl.current)
  end

  def test_traversing
    dl = DataStructures::DoublyLinkedList.new
    dl << 20
    dl << 50
    dl << 10
    dl << 35
    assert_equal(35, dl.current)
    assert_equal(10, dl.next)
    assert_equal(50, dl.next)
    assert_equal(20, dl.next)
    assert_equal(50, dl.previous)
    assert_equal(10, dl.previous)
    assert_equal(50, dl.next)
  end

  def test_inserting_after
    dl = DataStructures::DoublyLinkedList.new
    dl << 20
    dl << 50
    dl.insert_after(21, 20)
    assert_equal(20, dl.next)
    assert_equal(21, dl.next)
  end

  def test_inserting_before
    dl = DataStructures::DoublyLinkedList.new
    dl << 20
    dl << 50
    dl.insert_before(21, 20)
    assert_equal(21, dl.next)
    assert_equal(20, dl.next)
  end

  def test_deleting
    dl = DataStructures::DoublyLinkedList.new
    dl << 20
    dl << 50
    dl << 32
    dl.delete(50)
    assert_equal(20, dl.next)
    assert_equal(32, dl.previous)
  end

end
