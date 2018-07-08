
def kth_largest(tree_node, k)
    parent = tree_node
    count = count_right_branch(tree_node)
    if k <= count
        (count - k).times {tree_node = tree_node.right}
        return tree_node
    else
        return kth_largest(parent.left, k - count)
    end
end

def count_right_branch(tree_node)
    return 1 if tree_node.right.nil?
    return 1 + count_right_branch(tree_node.right)
end
