require 'pry'
require 'pry-debugger'
module DataStructures
  module LinearProbe
    class DataItem

      attr_reader :value
      def initialize(value)
        @value = value
      end

      def key
        @value
      end

    end
    class HashTable

      def initialize(size)
        @size = size
        @hash = Array.new(size)
      end

      def insert(value)
        item = DataItem.new(value)
        key = hash(item.key)
        while @hash[key] && key < @size
          key += 1
          key = hash(key) 
        end
        @hash[key] = item
      end

      def find(value)
        key = hash(value)
        while @hash[key] && key < @size
          if @hash[key].key == value
            return @hash[key]
          end
          key += 1
          key = hash(key)
        end
      end

      def remove(value)
        key = hash(value)
        while @hash[key] && key < @size
          if @hash[key].key == value
            @hash.delete_at(key)
            return nil
          end
          key += 1
          key = hash(key)
        end
      end

      private

      def hash(key)
        key % @size
      end


    end
  end
end
