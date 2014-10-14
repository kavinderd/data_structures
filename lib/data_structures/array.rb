module DataStructures
  class Array
    
    attr_reader :size, :max_size
    def initialize(size)
      @internal_array = ::Array.new
      @max_size = size
      @size = 0
    end

    def [](index)
      @internal_array[index]
    end

    def []=(index, item)
      @internal_array[index] = item
      increment
    end

    def <<(item)
      @internal_array << item
      increment
    end

    def push(item)
      @internal_array.push(item)
      increment
    end

    def pop
      decrement
      @internal_array.pop
    end

    def insert(index, item)
      @internal_array[index] = item
      increment
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

    def delete(item)
      index = find(item)
      index.upto(size - 1) do |i|
        @internal_array[i] = @internal_array[i+1]
      end
      decrement
    end

    def to_s
      string = "["
      (size).times do |i|
        string << "#{@internal_array[i]},"
      end
      string[-1] = "]"
      string
    end

    def max
      max_val = 0
      @internal_array.each do |element|
        if element > max_val
          max_val = element
        end 
      end
      max_val
    end

    def min
      min_val = 9999999999999999 #Super Hacky
      @internal_array.each do |element|
        if element < min_val
          min_val = element
        end
      end
      min_val
    end

    private

    def increment
      @size += 1
    end

    def decrement
      @size -= 1
    end

  end
end
