require_relative "heap"

class Array
  def heap_sort!
    2.upto(self.length).each do |idx|
      BinaryMinHeap.heapify_up(self, idx - 1, idx)
    end

    (self.length).downto(2) do |idx|
      original = self[idx-1]
      self[idx-1] = self[0]
      self[0] = original
      BinaryMinHeap.heapify_down(self, 0, idx - 1)
    end
    self.reverse!
  end
end
