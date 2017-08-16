class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
   each_with_index.reduce(0) do |intermediate, (el,i)|
    (el.hash + i.hash) ^ intermediate
  end
  end
end

class String
  def hash
    chars.map {|ch| ch.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
    self.to_a.sort_by {|el| el.hash}.hash
    # self.to_a.map(&:hash).hash
  end
end
