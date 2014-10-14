require_relative '../../lib/data_structures/array'
require 'minitest/autorun'
require 'pry'
require 'pry-debugger'

class ArrayTest < MiniTest::Test
  def test_array_initialization
    ar = DataStructures::Array.new(5)
    assert_equal(5, ar.size)
  end

  def test_adding_to_array
    ar = DataStructures::Array.new(5)
    ar[0] = 1
    assert_equal(1, ar[0])
  end

  def test_pushing_to_an_array
    ar = DataStructures::Array.new(5)
    ar << 1
    assert_equal(1, ar[-1])
  end

  def test_pushing_to_an_array_via_named_method
    ar = DataStructures::Array.new(5)
    ar.push(1)
    assert_equal(1, ar[-1])
  end

  def test_popping_from_an_array
    ar = DataStructures::Array.new(5)
    ar.push(1)
    assert_equal(1, ar.pop)
  end

  def test_accessing_a_nil_element
    ar = DataStructures::Array.new(5)
    assert_equal(nil, ar.pop)
    assert_equal(nil, ar[0])
    assert_equal(nil, ar[-1])
  end

  def test_insert_method
    ar = DataStructures::Array.new(5)
    ar.insert(2, 15)
    assert_equal(15, ar[2])
  end

  def test_finding_an_element_in_an_array
    ar = DataStructures::Array.new(5)
    ar[0] = 23
    ar[1] = 235
    ar[2] = 20
    ar[3] = 92
    ar[4] = 445
    assert_equal(2, ar.find(20))
  end

  def test_finding_a_non_existent_element
    ar = DataStructures::Array.new(5)
    assert_equal(nil, ar.find(200))
  end
    

end
