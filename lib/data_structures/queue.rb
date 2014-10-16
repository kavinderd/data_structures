module DataStructures
  ##
  # Although highly unnecessary this queue is implemented as a circular queue/ring buffer.
  # However, because Ruby doesn't have fixed size arrays managing the front and rear indices
  # of a queue is overhead that wouldn't normally be required, but it's of interest to me.
  
  class QueueOverflow < Exception; end;
  class Queue
    attr_reader :max_size, :num_items
    def initialize(size)
      @max_size = size
      @queue = []
      @num_items = 0
      @front = 0
      @rear = 0
    end

    def enqueue(item)
      raise QueueOverflow unless @num_items < @max_size
      @queue[enqueue_position] = item 
      @rear = update_index_position(@rear)
      @num_items += 1
    end

    def dequeue
      output = @queue[dequeue_position]
      @num_items -= 1
      @front = update_index_position(@front)
      output
    end

    private

    def enqueue_position
      @rear
    end

    def dequeue_position
      @front 
    end
    
    def update_index_position(index)
      if index + 1 <= max_size - 1
        index += 1
      else
        index = 0
      end
    end

  end
end
