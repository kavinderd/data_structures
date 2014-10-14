module DataStructures
  class Array
    
    def initialize(size)
      @internal_array = ::Array.new(size)
    end

    def size
      @internal_array.size
    end

    def [](index)
      @internal_array[index]
    end

    def []=(index, item)
      @internal_array[index] = item
    end

    def <<(item)
      @internal_array << item
    end

    def push(item)
      @internal_array.push(item)
    end

    def pop
      @internal_array.pop
    end

    def insert(index, item)
      @internal_array[index] = item
    end

    def find(item)
      found = nil
      @internal_array.each_with_index do |value, index|
        if value == item
          return found = index
        end
      end
      found
    end

  end
end
