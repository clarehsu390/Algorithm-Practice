require_relative "static_array"

class DynamicArray
  attr_reader :length
  

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
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
  def []=(index, value)
    
 if index >= @length
      (index - @length).times { push(nil) }
    elsif index < 0
      raise "index out of bounds" if index < -(@length)
      return self[@length + index] = value
    end
    if index == @length
      resize! if capacity == @length
      @length += 1
    end
    @store[(@start_idx + index) % capacity] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    last_item = @store[(@start_idx + @length- 1) % capacity]
    @length -= 1
    last_item
  end

  # def capacity
  #   @store.length
  # end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
  
    resize! if capacity == @length
    @store[(@start_idx + @length) % capacity] = val
    @length += 1
    self
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    @length -= 1
    first_item = @store[@start_idx]
    @start_idx = (@start_idx + 1) % capacity
    first_item
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    
    resize! if capacity == @length
    @start_idx = (@start_idx - 1) % capacity
    @store[@start_idx] = val
    @length += 1
    self
  end

  protected
  attr_accessor :store, :capacity
  attr_writer :length

  def check_index(index)
  
    if index >= @length
      raise "index out of bounds"
    elsif index < 0
      raise "index out of bounds" if index < -(@length)
      return self[@length + index]
    end
    
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity = capacity * 2
    new_store = StaticArray.new(@capacity)
    
    i = 0
    while i < @length
      new_store[i] = self[i]
      i += 1
    end
    @store = new_store
    @start_idx = 0
  end
end


