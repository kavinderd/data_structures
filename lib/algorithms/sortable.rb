module Algorithms
  module Sortable

    extend self

    ##
    # It gets no worse than a bubble sort algorithm
    # Due to that fact that the bubble sort simply goes from one end
    # to the other and compares values of n with n+1 it makes
    # the algorithm inefficient, so much so that it runs in
    # O(n^2) time.
    def bubble_sort(array, visualize=false)
      result = array.dup
      size = array.size
      size.times do |i|
        (i+1).upto(array.size - 1) do |j|
          if result[i] > result[j]
            result[i], result[j] = result[j], result[i]
          end
          p result if visualize
        end
      end
      result
    end

    ##
    # The selection sort algorithm functions by selecting the 
    # minimum value in the unsorted portion of the array and moving 
    # that to the ith position.  It is an improvement over bubble sort as n^2 swaps
    # are not made. However, the algorithm itself runs in 0(n^2) time due to the fact that
    # over the n elements the algorithm needs to check potentially n -1 inner elements 
    # for whether a swap is required. However, selection sort is considerably faster
    # than bubble sort for large values of n, because there are far fewer swap operations going on.
    # At most a value will be swapped left-word once.
    def selection_sort(array, visualize=false)
      result = array.dup
      min = 0
      (result.size).times do |i|
        min = i;
        (i+1).upto(array.size - 1) do |j|
          if result[j] < result[min]
            min = j
          end
        end
        result[i], result[min] = result[min], result[i]
        p result if visualize
      end
      result
    end


    ##
    # Insertion sort functions by taking an element at i
    # and then comparing it with all the elements that are to the left
    # thus with ever iteration of i all values  < i are sorted and
    # all values > i are not.  Insertion sort still runs in O(n^2) time because
    # it is iterating over n items (outer loop) at worst number of times (inner loop)
    # However, compared to selection_sort, because the left hand side of i is sorted on average
    # there only need to be 1/2 as many comparisons before finding the insertion point
    # for any given n. That being said, in a case where an array is in inverse order, this algorithm
    # runs as poorly as bubble sort as every possible comparison and swap is made.
    def insertion_sort(array, visualize=false)
      result = array.dup
      result.size.times do |i|
        j = i
        while(j > 0 && result[j] < result[j-1])
          result[j], result[j-1] = result[j-1], result[j]
          j -= 1
        end
      end
      result
    end


    ##
    # The even odd sort runs similar to a bubble sort and in virtually similar efficiency
    # However, because evens and odds are processed separately odd_even sort is ideal
    # for parallel processing
    def odd_even_sort(array, visualize=false)
      result = array.dup
      turn = [0,1].cycle
      pass = turn.next
      sorted = false
      while(!sorted)
        sorted = true
        result.size.times do |i|
          if i % 2 == pass && result[i+1]
            if result[i] > result[i+1]
            result[i], result[i+1] = result[i+1], result[i] 
            sorted = false
            end
          end
        end
        pass = turn.next
      end
      result
    end

    ##
    # The mergesort is a more efficient form of sorting compared to those above because of the way
    # the algorithm breaks the larger array into smaller subsections.  As with the above algorithms
    # there is still a need to make N comparisons but instead of making these comparisons N times
    # resulting in O(n^2) instead we compare logN times. This is because of the divide-and-conquer 
    # aspect of mergesort. At each point we divide an array in half and then merge we always make N comparisons
    # However, the halving process only occurs logN times.  For instance, with an array of size 8 we make N comparisons
    # at size 8,4,2. Whereas in bubble sort we would make 8 comparisons 8 times.  
    #  
    def mergesort(array)
      if array.size == 1
        array
      else
        mid = array.size / 2
        left_ar = mergesort(array.slice(0...mid))
        right_ar = mergesort(array.slice(mid..-1))
        merge(left_ar, right_ar)
      end
    end

    def merge(ar1, ar2)
      result = []
      i = 0
      j = 0
      while i < ar1.length && j < ar2.length
        a = ar1[i]
        b = ar2[j]
        if a < b
          result << a
          i += 1
        elsif b < a
          result << b
          j += 1
        end
      end
      while i < ar1.length
        result << ar1[i]
        i += 1
      end
      while j < ar2.length
        result << ar2[j]
        j += 1
      end
      result
    end
    
  end
end
