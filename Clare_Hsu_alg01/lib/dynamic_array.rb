require_relative "static_array"

class DynamicArray
  attr_reader :length
  

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @length = 0
    @capacity = capacity
  
  end

  # O(1)
  def [](index)
    check_index(index)
    # @store[(@start_idx + index) % capacity]
    @store[index]
  end

  # O(1)
  def []=(index, value)
    
    # if index >= @length
    #   (index - @length).times { push(@store[index]) }
    # elsif index < 0
    #   # raise "index out of bounds" if index < -(@length)
    #   return self[@length + index]
    # end

    if index == @length
      resize! if capacity == @length
      @length += 1
    end
    # @store[(@start_idx + index) % capacity] = value
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    # last_item = @store[(@start_idx + @length- 1) % capacity]
   
    last_item = self[self.length - 1]
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
    @length += 1
    self[self.length - 1] = val
    self
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    val = self[0]
    (1...length).each do |i|
      self[i-1] = self[i]
    end
    @length -= 1
    val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    
    resize! if capacity == @length
    @length += 1
    i = 0
    # while i <= @length - 2
    #   self[i] = self[i+1]
    #   i += 1
    # end
    (@length - 2).downto(0).each do |i|
      self[i+1] = self[i]
    end
    self[0] = val
    self
 
    
  end

  protected
  attr_accessor :store, :capacity
  attr_writer :length

  def check_index(index)
    # raise "index out of bounds" unless index.between?(0, length - 1)
    if index >= @length || index < 0
      raise "index out of bounds"
    # elsif index < 0
    #   raise "index out of bounds" if index < -(@length)
      # return self[@length + index]
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


