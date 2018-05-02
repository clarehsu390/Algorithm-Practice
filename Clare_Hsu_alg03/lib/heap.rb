class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []

  end

  def count
    @store.length
    
  end

  def extract
    #pop
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    element = @store.pop
    BinaryMinHeap.heapify_down(store, 0)
    element
  end

  def peek
    #min/max
    #current priority item - smallest integer O(1)
   @store.first
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(store, count - 1)

   
  end

  public
  def self.child_indices(len, parent_index)
    left_child = (2 * parent_index) + 1
    right_child = (2 * parent_index) + 2
    [left_child, right_child].select { |child| child < len}

  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    (child_index - 1)/2
    
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new {  |x,y| x <=> y}
    children = child_indices(len, parent_idx)
    return array if parent_idx >= len - 1 || children.length == 0
    if children.length == 1
      swap_child = children[0]
    elsif children.length == 2
      swap_child = prc.call(array[children[0]], array[children[1]]) == -1 ? children[0] : children[1]
    end

      if prc.call(array[parent_idx], array[swap_child]) == 1
        array[parent_idx], array[swap_child] = array[swap_child], array[parent_idx]
        heapify_down(array, swap_child, len, &prc)
      else
        return array
      end
    array


    #check if parent_node > child_node, go down
  
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    #check if child node < parent node, go up
   prc ||= Proc.new { |x,y| x <=> y}
   return array if child_idx == 0
   parent_idx = parent_index(child_idx)
   if prc.call(array[parent_idx], array[child_idx]) == 1
    og_parent = array[parent_idx]
    array[parent_idx] = array[child_idx]
    array[child_idx] = og_parent

    heapify_up(array, parent_idx, len, &prc)
   else
    return array
    
  end
  array
end
end
