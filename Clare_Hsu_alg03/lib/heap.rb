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
    @store.pop
  end

  def peek
    #min/max
    #current priority item - smallest integer O(1)
  end

  def push(val)
    #insert
  end

  public
  def self.child_indices(len, parent_index)
    parent_index = (parent_index % len)
    
    [(2 * parent_index), (2 * parent_index) + 1]
  end

  def self.parent_index(child_index)
    child_index/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    #check if parent_node < child_node, go down
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    #check if child node > parent node, go up
  end
end
