class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    #doubley-linked list two pointers
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head

  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    return nil if empty?
    @head.next #next head
  end

  def last
   return nil if empty?
   @tail.prev #
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      if (node.key == key)
        return node.val
      end
    end
  end

  def include?(key)
    any? {|el| el.key == key}
    
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev = new_node
    new_node
    
  
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
    
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.prev.next = node.next
        node.next.prev = node.prev
      end
    end
  end

  def each
    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
