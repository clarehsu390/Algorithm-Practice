class MaxIntSet
  def initialize(max)
    @store = []
    @length = max
  end

  def insert(num)
    validate!(num)
    @store[num] = true if !@store[num]
  end

  def remove(num)
    @store[num] = false if @store[num]
  end

  def include?(num)
    return true if @store[num]
  end

  private

  def is_valid?(num)
  num.between?(0, @length)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    self[num] << num
    @count += 1
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) {Array.new}
    p old_store
    old_store.each_with_index do |bucket, idx|
      bucket.each do |el|
      self[el] << el
      end
    end
    self

  end
end
