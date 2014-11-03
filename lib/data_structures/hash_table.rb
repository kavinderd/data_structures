require 'pry'
require 'pry-debugger'
module DataStructures
  class DataItem

    attr_reader :value
    def initialize(value)
      @value = value
    end

    def key
      @value
    end

  end
  class NullDataItem
    def key
      -1
    end
  end
  class HashTable
    HASH_TYPES = [:linear_probing, :double_hashing]

    def initialize(size, type=:linear_probing)
      @size = size
      @hash = Array.new(size)
      if HASH_TYPES.include?(type)
        @hash_type = type
      else
        raise "Hash type not valid"
      end
    end

    def insert(value)
      send("#{@hash_type}_insert", value)
    end

    def find(value)
      send("#{@hash_type}_find", value)
    end

    def remove(value)
      send("#{@hash_type}_remove", value)
    end

    private 
    
    def double_hashing_insert(value)
      item = DataItem.new(value)
      key = hash(item.key)
      step = double_hash(key)
      while @hash[key] && key < @size
        key += step
        key = hash(key)
      end
      @hash[key] = item
    end

    def double_hashing_find(value)
      key = hash(value)
      step = double_hash(key)
      while @hash[key] && key < @size
        if @hash[key].key == value
          return @hash[key]
        end
        key += step
        key = hash(key)
      end
    end

    def double_hashing_remove(value)
      key = hash(value)
      step = double_hash(value)
      while @hash[key] && key < @size
        if @hash[key].key == value
          @hash[key] = NullDataItem.new
          return nil
        end
        key += 1
        key = hash(key)
      end
    end

    def linear_probing_insert(value)
      item = DataItem.new(value)
      key = hash(item.key)
      while @hash[key] && key < @size
        key += 1
        key = hash(key) 
      end
      @hash[key] = item
    end

    def linear_probing_find(value)
      key = hash(value)
      while @hash[key] && key < @size
        if @hash[key].key == value
          return @hash[key]
        end
        key += 1
        key = hash(key)
      end
    end

    def linear_probing_remove(value)
      key = hash(value)
      while @hash[key] && key < @size
        if @hash[key].key == value
          @hash[key] = NullDataItem.new
          return nil
        end
        key += 1
        key = hash(key)
      end
    end

    def hash(key)
      key % @size
    end

    def double_hash(key)
      5 - ( key % 5 )
    end


  end
end
