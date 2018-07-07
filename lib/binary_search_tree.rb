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
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
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
    if parent.value > node.value 
      if parent.left.nil?
        parent.left = node
      else insert_as_child(node, parent.left)
      end
    elsif parent.value < node.value
       if parent.right.nil?
        parent.right = node
       else insert_as_child(node, parent.right)
       end
    end
  end

end
