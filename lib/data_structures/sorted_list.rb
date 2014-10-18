require_relative 'linked_list'
##
# This implementation of a Sorted List only touches upon the sorting aspect of the list
# the other components that are similar to my LinkedList implementation could be
# easily implemented here so I'm forgoing that.
module DataStructures
  
  class SortedList < LinkedList
  
    def << (item)
      pred, succ = find_position(item)
      if pred
        pred.next = Link.new(item, succ)
      else
        super(item)
      end
    end

    private

    def find_position(item)
      pred = nil
      succ = @start.next if @start
      while succ && item > succ.data
        pred = succ
        succ = succ.next
      end
      return pred, succ
    end

  end
end
