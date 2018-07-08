# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node.rb'
class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    node = BSTNode.new(value)
    if @root.nil?
      @root  = node 
    else insert_as_child(node, @root)
    end
  end

  def find(value, tree_node = @root)
    if tree_node.value == value 
      return tree_node
    elsif value < tree_node.value
      if tree_node.left.nil? 
        return nil 
      else 
        return find(value, tree_node.left)
      end
    else
      if tree_node.right.nil? 
        return nil 
      else 
        return find(value, tree_node.right)
      end
    end
  end

  def delete(value)
    if @root.value == value
      @root = nil 
    else
    node = find(value, @root)
    delete_from_parent(node, @root)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right.nil?
      return tree_node
    else return maximum(tree_node.right)
    end
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil?
    if tree_node.left.nil? && tree_node.right.nil?
      return 0
    elsif tree_node.left.nil?
      return 1 + depth(tree_node.right)
    elsif tree_node.right.nil?
      return 1 + depth(tree_node.left)
    else
      left_depth = depth(tree_node.left) 
      right_depth = depth(tree_node.right) 
      if left_depth > right_depth 
        return left_depth + 1
      else 
        return right_depth + 1
      end
    end
  end 

  def is_balanced?(tree_node = @root)
    check_left = tree_node.left.nil? ? true : is_balanced?(tree_node.left) 
    check_right = tree_node.right.nil? ? true : is_balanced?(tree_node.right) 
    (depth(tree_node.left) - depth(tree_node.right)).abs <= 1 && check_left && check_right
  end

  def in_order_traversal(tree_node = @root, arr = [])
    left = tree_node.left.nil? ? [] : in_order_traversal(tree_node.left, arr)
    right = tree_node.right.nil? ? [] : in_order_traversal(tree_node.right, arr)
    return left.concat([tree_node.value]).concat(right)
  end


  private
  # optional helper methods go here:

  def insert_as_child(node, parent)
    if parent >= node 
      if parent.left.nil?
        parent.left = node
      else insert_as_child(node, parent.left)
      end
    elsif parent < node
       if parent.right.nil?
        parent.right = node
       else insert_as_child(node, parent.right)
       end
    end
  end

  def delete_from_parent(node, parent)
    if node.right.nil? && node.left.nil?
      reassign_node(parent, node, nil)
    elsif node.right.nil?
      reassign_node(parent, node, node.left)
    elsif node.left.nil?
      reassign_node(parent, node, node.right)
    else
      node_r = maximum(node.left)
      reassign_node(parent, node_r, node_r.left) if !node_r.left.nil?
      reassign_node(parent, node, node_r)
    end
  end

  def reassign_node(parent, old_child, new_child)
    if parent.left == old_child
      parent.left = new_child
    elsif parent.right == old_child
      parent.right = new_child
    elsif old_child <= parent
      reassign_node(parent.left, old_child, new_child)
    else reassign_node(parent.right, old_child, new_child)
    end
  end

end
