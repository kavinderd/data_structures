require_relative '../../lib/data_structures/queue'
require 'minitest/autorun'

class QueueTest < Minitest::Test

  def queue(size=5)
    DataStructures::Queue.new(5)
  end

  def test_items_count
    q = DataStructures::Queue.new(5)
    assert_equal(0, q.num_items)
  end

  def test_enqueueing
    q = queue
    q.enqueue(1)
    assert_equal(1, q.num_items)
  end

  def test_dequeueing
    q = queue
    q.enqueue(1)
    q.enqueue(5)
    q.enqueue(7)
    assert_equal(1, q.dequeue)
  end

  def test_overflow
    q = queue
    q.enqueue(1)
    q.enqueue(5)
    q.enqueue(7)
    q.enqueue(9)
    q.enqueue(10)
    assert_raises(DataStructures::QueueOverflow) { q.enqueue(3) }
  end

  def test_circular_buffering
    q = queue
    q.enqueue(1)
    q.enqueue(5)
    q.enqueue(7)
    q.enqueue(9)
    q.enqueue(10)
    q.dequeue
    q.enqueue(4)
    assert_equal(5, q.dequeue) 
  end
end
