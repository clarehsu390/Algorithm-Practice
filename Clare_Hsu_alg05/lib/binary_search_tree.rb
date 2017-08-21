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
    @root = BinarySearchTree.delete!(@root, value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node unless tree_node
    return tree_node unless tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 unless tree_node
    return 0 unless tree_node.left || tree_node.right
    left = depth(tree_node.left)
    right = depth(tree_node.right)
    left > right ? left + 1 : right + 1


  
  end 

  def is_balanced?(tree_node = @root)
    depth(tree_node.left) == depth(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] unless tree_node

    arr += in_order_traversal(tree_node.left) if tree_node.left
    arr << tree_node.value
    arr += in_order_traversal(tree_node.right) if tree_node.right
    arr
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
      BinarySearchTree.find!(tree_node.left, value)
    else
      BinarySearchTree.find!(tree_node.right, value)
    end
  end

  def self.delete!(tree_node, value)
    return nil unless tree_node

    if value < tree_node.value
      tree_node.left = BinarySearchTree.delete!(tree_node.left, value)
    else 
      return tree_node.left unless tree_node.right
      return tree_node.right unless tree_node.left

      original = tree_node
      # tree_node = maximum(original.left)
      tree_node.right = BinarySearchTree.delete_max!(original.right)
      tree_node.left = original.left
    end
    tree_node
    end

   def self.delete_max!(tree_node)
    return nil unless tree_node
    return tree_node.right unless tree_node.left

    tree_node.right = BinarySearchTree.delete_max!(tree_node.right)
    tree_node
  end


  def self.postorder!(tree_node)
    return [] unless tree_node

    arr = []
    arr += BinarySearchTree.postorder!(tree_node.left) if tree_node.left
    arr += BinarySearchTree.postorder!(tree_node.right) if tree_node.right
    arr << tree_node.value

    arr
  end



  # def self.depth!(tree_node)
  #    return -1 unless tree_node
  #   1 + [BinarySearchTree.depth!(tree_node.left), BinarySearchTree.depth!(tree_node.right)]
  # end


end
