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
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
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
