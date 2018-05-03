class MedianFinder
    def intialize
        @low = MaxHeap.new
        @high = MinHeap.new
    end

    def add(num)
        @low.push(num)
        @high.push(@low.extract)

        if @high.count > @low.count
            @low.push(@high.extract)
        end
    end

    def find_median
        if @low.count > @high.count
            @low.peek
        else
            (@low.peek + @high.peek) / 2
        end

    end
end

#maxheap to store the lower half
#minheap to store the upper half 
#maxheap.length - minheap.length <= 1