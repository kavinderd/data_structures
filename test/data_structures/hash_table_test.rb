require_relative "../../lib/data_structures/hash_table"
require "minitest/autorun"

class HashTableTest < MiniTest::Test

  def setup
    @type = DataStructures::HashTable::HASH_TYPES.sample
  end
  def test_hashing_an_inserted_item
    h = DataStructures::HashTable.new(100, :separate_chaining)
    h.insert(453)
    assert_equal(453, h.find(453).value)
  end

  def test_hashing_a_duplicate_hash
    h = DataStructures::HashTable.new(100, @type)
    h.insert(453)
    h.insert(4053)
    assert_equal(4053, h.find(4053).value)
  end

  def test_removing_an_item
    h = DataStructures::HashTable.new(10,@type)
    h.insert(11)
    h.insert(1)
    h.remove(11)
    assert_equal(nil, h.find(11))
    assert_equal(1, h.find(1).value)
  end

end

