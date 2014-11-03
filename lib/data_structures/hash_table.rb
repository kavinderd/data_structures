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

  class Link

    attr_reader :value
    attr_accessor :next
    def initialize(value)
      @value = value
    end

    def key
      @value
    end

  end

  class SortedList
    
    attr_reader :start
    def initialize
    end

    def insert(key)
      link = Link.new(key)
      previous = nil
      current = start
      while current && key > current.key
        previous = current
        current = current.next
      end
      if previous
        previous.next = link
        link.next = current
      else
        @start = link
      end
    end

    def delete(key)
      previous =nil
      current = @start
      while current && key != current.key
        previous = current
        current = current.next
      end
      if previous
        previous.next = current ? current.next : nil
      else
        @start = nil
      end
    end

    def find(key)
      current = @start
      while current && current.key <= key
        if current.key == key
          return current
        else
          current = current.next
        end
      end
    end

  end
  class HashTable
    HASH_TYPES = [:linear_probing, :double_hashing, :separate_chaining]

    def initialize(size, type=:linear_probing)
      @size = size
      @hash = Array.new(size)
      if HASH_TYPES.include?(type)
        @hash_type = type
      else
        raise "Hash type not valid"
      end
      set_default_hash 
    end

    def set_default_hash
      @hash = if @hash_type = :separate_chaining
                Array.new(@size, SortedList.new)
              else
                Array.new(@size)
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

    def separate_chaining_insert(value)
      item= Link.new(value)
      key = hash(value)
      @hash[key].insert(value) 
    end

    def separate_chaining_find(value)
      key = hash(value)
      @hash[key].find(value)
    end

    def separate_chaining_remove(value)
      key = hash(value)
      @hash[key].delete(value)
    end
    
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
