require_relative '../../lib/data_structures/stack'
require 'minitest/autorun'

class StackTest < MiniTest::Test

  def stack(size=10)
    DataStructures::Stack.new(size)
  end

  def test_initialize_stack_with_size
    s = stack(10)
    assert_equal(0, s.size)
    assert_equal(10, s.max_size)
  end 

  def test_push
    s = stack
    s.push(1)
    assert_equal(1, s.size)
  end

  def test_pop
    s = stack
    s.push(1)
    assert_equal(1, s.pop)
  end

  def test_overflow
    s = stack(2)
    s.push(1)
    s.push(45)
    assert_raises(DataStructures::StackOverflow) { s.push(46) }
  end

  def test_empty
    s = stack(2)
    assert_equal(true, s.empty?)
    s.push(1)
    assert_equal(false, s.empty?)
  end

end
