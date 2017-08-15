require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(capacity=8)
    @length = 0
    @start_idx = 0 
    @capacity = capacity
  end

  # O(1)
  def [](index)
    
    check_index(index)
    @store[(@start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    if index >= @length
      (index - @length).times { push(@store[index]) }
    elsif index < 0
      raise "index out of bounds" if index < -(@length)
      return self[@length + index] = val
    end
    if index == @length
      resize! if capacity == @length
      @length += 1
    end
    @store[(@start_idx + index) % capacity] = val

  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    last_item = @store[(@start_idx + @length - 1) % capacity]
    @length -= 1
    last_item

  end

  # O(1) ammortized
  def push(val)
    resize! if capacity == @length
    @store[(@start_idx + @length) % capacity] = val
    @length += 1
    self
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    first_item = @store[@start_idx]
    @length -= 1
    @start_idx = (@start_idx + 1) % capacity
  
    first_item
  end

  # O(1) ammortized
  def unshift(val)

    resize! if capacity == @length
    @start_idx = (@start_idx - 1) % capacity
    @store[@start_idx] = val
    @length += 1
    self
    
    
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
     if index >= @length
      raise "index out of bounds"
    elsif index < 0
      raise "index out of bounds"
      return self[@length + index]
    end
  end

  def resize!
   
    new_store = StaticArray.new(@capacity * 2)
    i = 0 
    while i < @capacity
      new_store[i] = self[i]
      i += 1
      
    end
    @store = new_store
    @capacity = capacity * 2
    @start_idx = 0
    
   end
end
