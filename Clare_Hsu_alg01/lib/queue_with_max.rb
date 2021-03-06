# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
  end

  def enqueue(val)
    @store.unshift(val)
  end

  def dequeue
    @store.pop
  end

  def max
    i = 0
    max = @store[0]
    while i < length
      if @store[i] > max
        max = @store[i]
      end 
      i += 1
    end
    max
  end

  def length
    @store.length
  end

end
