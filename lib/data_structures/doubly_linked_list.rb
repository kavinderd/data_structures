module DataStructures
  class DoubleLink
    
    attr_reader :data
    attr_accessor :next, :previous
    def initialize(data, options={})
      @data =data
      @next = options[:next]
      @previous = options[:previous]
    end

  end
  class DoublyLinkedList

    def initialize(item=nil)
      @start = item
      set_current(@start)
    end

    def next
      return nil unless next?(@current)
      @current = @current.next
      @current.data
    end

    def previous
      return nil unless previous?(@current)
      @current = @current.previous
      @current.data
    end

    def <<(item)
      if @start
        tmp = @start
        link = DoubleLink.new(item, next: tmp)
        tmp.previous = link
        @start = link
      else
        @start = DoubleLink.new(item)
      end
      set_current(@start)
    end
    
    def insert_after(item, after)
      after_link = find(after)
      if after_link
        new_link = DoubleLink.new(item, previous: after_link, next: after_link.next)
        after_link.next = new_link
        after_new = new_link.next
        after_new.previous = new_link if after_new
      end
    end

    def insert_before(item, before)
      before_link = find(before)
      if before_link
        new_link = DoubleLink.new(item, next: before_link, previous: before_link.previous)
        before_link.previous = new_link
        before_new = new_link.previous
        before_new.next = new_link if before_new
      end
    end

    def delete(item)
      link = find(item)
      if link
        before = link.previous
        after = link.next
        before.next = after
        after.previous = before
      end
    end

    def find(item)
      return @start if @start.data == item
      link = @start.next
      while link
        if link.data == item
          return link
        end
        link = link.next
      end
    end

    def current
      @current.data if @current
    end

    private
    
    def set_current(link)
      @current = link
    end

    def next?(link)
      link && link.next
    end

    def previous?(link)
      link && link.previous
    end
  end
end
