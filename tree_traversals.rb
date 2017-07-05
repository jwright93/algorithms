class TreeNode
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

# def in_order(root)
#   return nil unless root
#
#     in_order(root.left)
#     p root
#     in_order(root.right)
# end
#
# def pre_order(root)
#   return nil unless root
#   p root
#   pre_order(root.left)
#   pre_order(root.right)
#
# end
#
def post_order(root)
  return nil unless root
  post_order(root.left)
  post_order(root.right)
  p root.data
end


def in_order_iterative(root)
  stack = []
  result = []
  current = root
  done = false

  until done == true
    if current
      stack << current
      current = current.left
    else
      if stack.empty?
        done = true
      else
        current = stack.pop
        result << current.data
        current = current.right
      end
    end
  end
  result
end


def pre_order_iterative(root)
  stack = []
  result = []
  stack << root

  until stack.empty?
    current = stack.pop
    result << current.data

    stack << current.left if current.left
    stack << current.right if current.right
  end

  result

end


root = TreeNode.new(1)
left = root.left = TreeNode.new(2)
right = root.right = TreeNode.new(3)
left.left = TreeNode.new(4)
left.right = TreeNode.new(5)

post_order(root)
