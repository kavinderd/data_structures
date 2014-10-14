require_relative '../../lib/data_structures/array'
require 'minitest/autorun'
require 'pry'
require 'pry-debugger'

class ArrayTest < MiniTest::Test

  def test_array(size=5)
    DataStructures::Array.new(size)
  end

  def test_adding_to_array
    ar = test_array
    ar[0] = 1
    assert_equal(1, ar[0])
  end

  def test_pushing_to_an_array
    ar = test_array
    ar << 1
    assert_equal(1, ar[-1])
  end

  def test_pushing_to_an_array_via_named_method
    ar = test_array
    ar.push(1)
    assert_equal(1, ar[-1])
  end

  def test_popping_from_an_array
    ar = test_array
    ar.push(1)
    assert_equal(1, ar.pop)
  end

  def test_accessing_a_nil_element
    ar = test_array
    assert_equal(nil, ar.pop)
    assert_equal(nil, ar[0])
    assert_equal(nil, ar[-1])
  end

  def test_insert_method
    ar = test_array
    ar.insert(2, 15)
    assert_equal(15, ar[2])
  end

  def test_finding_an_element_in_an_array
    ar = test_array
    ar[0] = 23
    ar[1] = 235
    ar[2] = 20
    ar[3] = 92
    ar[4] = 445
    assert_equal(2, ar.find(20))
  end

  def test_finding_a_non_existent_element
    ar = test_array
    assert_equal(nil, ar.find(200))
  end

  def test_deleting_an_element
    ar = test_array
    ar[0] = 23
    ar[1] = 235
    ar[2] = 20
    ar[3] = 92
    ar[4] = 445
    ar.delete(20)
    assert_equal(92, ar[2])
  end

  def test_array_size_count
    ar = test_array
    assert_equal(0, ar.size)
    ar << 3
    assert_equal(1, ar.size)
    ar << 4
    assert_equal(2, ar.size)
    ar.delete(3)
    assert_equal(1, ar.size)
  end

  def test_to_s_method
    ar = test_array
    ar[0] = 5
    ar[1] = 2
    assert_equal("[5,2]", ar.to_s)
  end

  def test_max_value
    ar = test_array
    ar << 33
    ar << 35
    ar << 88
    ar << 21
    ar << 93
    assert_equal(93, ar.max)
  end

  def test_min_value
    ar = test_array
    ar << 33
    ar << 35
    ar << 88
    ar << 21
    ar << 93
    assert_equal(21, ar.min)
  end
        
end
