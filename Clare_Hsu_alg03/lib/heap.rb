class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc 
    @store = []
  end

  def count
    @store.length
  end

  def extract
    #pop
    @store[0], @store[count-1] = @store[count-1], @store[0]

    element = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    element
  end

  def peek
    #min/max
    #current priority item - smallest integer O(1)
    @store.first
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, count - 1)
  end

  public
  def self.child_indices(len, parent_index)
    index1 = 2 * parent_index + 1
    index2 = 2 * parent_index + 2
    [index1, index2].select {|el| el < len}
  end

  def self.parent_index(child_index)
    
    raise "root has no parent" if (child_index - 1)/2 < 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    #check if parent_node > child_node, go down
    prc ||= Proc.new { |x,y| x <=> y}
    return array if parent_idx >= len - 1
    child_indices(len, parent_idx).each do |child|
      if prc.call(array[child], array[parent_idx]) >= 0
        return array
      else
      
        og_child = array[child]
        array[child] = array[parent_idx]
        array[parent_idx] = og_child
        heapify_down(array, child, len, &prc)
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    #check if child node < parent node, go up
    prc ||= Proc.new { |x,y| x <=> y}
    return array if child_idx == 0
    parent_idx = parent_index(child_idx)
    if prc.call(array[child_idx], array[parent_idx]) >= 0
      return array
    else
      og_child = array[child_idx]
      array[child_idx] = array[parent_idx]
      array[parent_idx] = og_child
      heapify_up(array, parent_idx, len, &prc)
    end
    array
    
  end
end
