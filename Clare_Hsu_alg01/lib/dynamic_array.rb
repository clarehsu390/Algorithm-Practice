require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(capacity=0)
    @length = 0
    @start_idx = 0

  end

  # O(1)
  def [](index)
    if index > @length
      return nil
    elsif index < 0
      return nil if index < -(@length)
      return self[@length + index]
    end
    @store[(@start_idx + index) % capacity]


  end

  # O(1)
  def []=(index, value)
    if index >= @length
      (index - @length).times { push(nil )}
    elsif index < 0 
      return nil if index < -(@length)
      return self[@length+index] = value
    end

    if index == @length
      resize! if capacity == @count
      @length += 1
    end
    @store[(@start_idx + index) % capacity] = value
  end

  # O(1)
  def pop
    return nil if @length == 0
    last_item = @store[(@start_idx + @length - 1) % capacity]
    @length -= 1
    last_item
  end

  def capacity
    @store.length
  end

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
    return nil if @length == 0
    @length -= 1
    first_item = @store[@start_idx]
    @start_idx = (@start_idx + 1) % capacity
    first_item
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
