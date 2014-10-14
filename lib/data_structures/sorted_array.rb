require_relative 'array'
require 'pry'
require 'pry-debugger'
module DataStructures
  class SortedArray < DataStructures::Array

    def << (item)
      super
      sort
    end

    def []=(item)
      super
      sort
    end

    def push(item)
      super
      sort
    end

    def pop(item)
      super
      pop
    end

    def find(item)
      #Use binary search
      binary_search(0, size - 1, item)
    end

    private

    def sort
      @internal_array = mergesort(@internal_array)
    end

    def mergesort(array)
      if array.size == 1
        array
      else
        mid = array.size / 2
        sub_ar1 = mergesort(array[0...mid])
        sub_ar2 = mergesort(array[mid..(array.length-1)])
        merge(sub_ar1, sub_ar2)
      end 
    end

    def merge(part1, part2)
      result = []
      i = 0
      j = 0
      while i < part1.size && j < part2.size
        a = part1[i]
        b = part2[j]
        if a < b
          result << a
          i += 1
        else
          result <<  b
          j += 1
        end
      end
      while i < part1.size
        result << part1[i]
        i += 1
      end
      while j < part2.size
        result << part2[j]
        j += 1
      end
      result
    end

    def binary_search(low, high, item)
     mid = low + high / 2
     if @internal_array[mid] == item
       mid
     elsif @internal_array[mid] > item
       binary_search(low, mid, item)
     else
       binary_search(mid, high, item) 
     end
    end

  end
end
