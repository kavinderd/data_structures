require_relative 'linked_list'
module DataStructures

  class DoubleEndedList

    def initialize(link=nil)
      @start = link
      set_end(@start)
      set_current(@start)
    end

    def insert(item)
      @start = Link.new(item, @start)
      set_current(@start)
      set_end(@start) unless @end
    end

    def append(item)
      new_end = Link.new(item)
      if @end
        @end.next = new_end
        set_end(new_end)
      else
        set_end(new_end)
        set_current(@end)
      end
    end

    def pop
      return nil unless @end
      pred = predecessor(@start, @end.data)
      result = @end.data
      if pred
        set_end(pred)
      end
      result
    end

    def shift
      return nil unless @start
      result = @start.data
      @start= @start.next
      set_current(@start)
      result
    end

    def current
      @current.data if @current
    end

    private

    def predecessor(link, item)
      return nil unless next?(link)
      if link.next.data == item
        link
      else
        predecessor(link.next, item)
      end
    end
      
    def next?(link)
      link && link.next
    end

    def set_end(link)
      @end = link
    end
    
    def set_current(link)
      @current = link
    end
    
  end
  
end
