module DataStructures

  class Link
    
    attr_reader :data
    attr_accessor :next
    def initialize(data, link=nil)
      @data = data
      @next = link
    end

  end

  class LinkedList

    def initialize(start=nil)
      @start = start 
      reset_current
    end

    def <<(item)
      @start = Link.new(item, @start)
      reset_current
    end

    def remove(item)
      link = search(item)
      if link
        pred = predecessor(@start, link)
        if pred
          pred.next = link.next
        else
          @start = link.next
        end
      end 
    end

    def search(item)
      return @start if @start.data == item
      link = @start
      while link.next
        if link.data == item
          return link
        else
          link = link.next
        end
      end
    end

    def predecessor(link, item)
      return nil unless next?(link)
      if link.next == item 
        link
      else
        predecessor(link.next, item)
      end
    end


    def next
      return nil unless next?(@current)
      @current = @current.next
      @current.data
    end

    def current
      @current.data if @current
    end

    private

    def reset_current
      @current = @start
    end

    def next?(link)
      link && link.next
    end

    def step
      @current = @current.next
    end

  end

end
