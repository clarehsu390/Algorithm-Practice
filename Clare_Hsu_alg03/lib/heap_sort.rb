require_relative "heap"

class Array
  def heap_sort!
    i = 0 
    while i < self.length
      BinaryMinHeap.heapify_up(self, i, self.length)
      i += 1
    end
    
    (self.length - 1).downto(0) do |idx|
      self[0], self[idx] = self[idx], self[0]
      BinaryMinHeap.heapify_down(self, 0, idx)
      
  end
  self.reverse!
end
end
