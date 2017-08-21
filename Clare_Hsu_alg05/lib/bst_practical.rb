
def kth_largest(tree_node, k)
    tree = BinarySearchTree.new
    new_arr = tree.in_order_traversal(tree_node, arr = [])
    value = new_arr[new_arr.length - k]
    tree.find(value, tree_node)
end
