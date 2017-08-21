# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
 attr_reader :root
  
  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
      return
    end
    BinarySearchTree.insert!(@root, value)
  end

  def find(value, tree_node = @root)
    BinarySearchTree.find!(tree_node, value)
    
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    BinarySearchTree.max(@root)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  def self.insert!(tree_node, value)
    return BSTNode.new(value) unless tree_node

    if value <= tree_node.value
      tree_node.left = BinarySearchTree.insert!(tree_node.left, value)
    else
      tree_node.right = BinarySearchTree.insert!(tree_node.right, value)
    end

    tree_node

  end

  def self.find!(tree_node, value)
    return nil unless tree_node
    return tree_node if value == tree_node.value

    if value < tree_node.value
      BinarySearchTree.find!(tree_node.left, value )
    end
    BinarySearchTree.find!(tree_node.right, value )
  end
end
