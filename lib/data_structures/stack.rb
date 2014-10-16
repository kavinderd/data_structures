module DataStructures
  class StackOverflow < Exception; end;
  class Stack

    attr_reader :max_size, :size
    def initialize(size)
      @max_size = size
      @stack = []
      @size = 0
    end

    def push(item)
      raise StackOverflow unless @size < @max_size
      @stack.push(item)
      @size += 1
    end

    def pop
      popped = @stack.pop
      @size -= 1 if popped
      popped
    end

    def empty?
      @size == 0
    end
  end
end
