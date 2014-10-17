require_relative '../../lib/data_structures/linked_list'
require 'minitest/autorun'
require 'pry'
require 'pry-debugger'

class LinkedListTest < MiniTest::Test

  def test_new_linked_list
    l = DataStructures::LinkedList.new
    assert_equal(nil, l.next)
  end

  def test_adding_a_link
    l = DataStructures::LinkedList.new
    l << "something"
    assert_equal("something", l.current)
    assert_equal(nil, l.next)
  end

  def test_removing_a_link
    l = DataStructures::LinkedList.new
    l << 34
    l << 21
    l << 4
    l.remove(21)
    assert_equal(34, l.next)
  end

end

class LinkTest < MiniTest::Test

  def test_setting_data
    l = DataStructures::Link.new("this is some data")
    assert_equal("this is some data", l.data)
  end

  def test_next_link
    l= DataStructures::Link.new(1)
    l2 = DataStructures::Link.new(2, l)
    assert_equal(l, l2.next)
  end

end
