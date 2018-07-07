class BSTNode
  attr_accessor :left, :right, :value
  def initialize(value)
    @value = value
  end

  def ==(node2)
    self.value == node2.value
  end
end

# n1 = BSTNode.new(1)
# n2 = BSTNode.new(2)
# puts(n1==n2)
# n3 = BSTNode.new(1)
# puts(n1 == n3)
