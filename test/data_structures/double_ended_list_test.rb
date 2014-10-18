require_relative '../../lib/data_structures/double_ended_list.rb'
require 'minitest/autorun'

class DoubleEndedListTest < MiniTest::Test
  
  def test_insert
    l = DataStructures::DoubleEndedList.new
    l.insert('hello')
    l.insert('goodbye')
    assert_equal('goodbye', l.current)
  end

  def test_append
    l = DataStructures::DoubleEndedList.new
    l.append('hello')
    l.append('goodbye')
    assert_equal('hello',l.current)
  end

  def test_insert_then_append
    l = DataStructures::DoubleEndedList.new
    l.insert('hello')
    l.append('goodbye')
    assert_equal('hello', l.current)
  end

  def test_append_then_insert
    l = DataStructures::DoubleEndedList.new
    l.append('goodbye')
    l.insert('hello')
    assert_equal('hello', l.current)
  end

  def test_pop
    l = DataStructures::DoubleEndedList.new
    l.insert('hello')
    l.insert('goodbye')
    l.insert('farewell')
    assert_equal('hello', l.pop)
    assert_equal('goodbye', l.pop)
  end

  def test_shift
    l = DataStructures::DoubleEndedList.new
    l.insert('hello')
    l.insert('goodbye')
    l.insert('farewell')
    assert_equal('farewell', l.shift)
    assert_equal('goodbye', l.shift)
  end

end
