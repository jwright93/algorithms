class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @data = val
        @left, @right = nil, nil
    end
end

def merge_tree(t1, t2)
  return nil if t1 == nil && t2 == nil

  if t1 && t2
    root = TreeNode.new(t1.data + t2.data)
    root.left = merge_tree(t1.left, t2.left)
    root.right = merge_tree(t1.right, t2.right)
    root
  else
    t1 || t2
  end


end


def same_tree?(t1, t2)
  return true if t1 == nil && t2 == nil

  if t1 && t2
    return (t1.val == t2.val &&
            same_tree?(t1.right, t2.right) &&
            same_tree?(t1.left, t2.left))
  end
    false
end



def deepest_node(root)
  return [0, nil] if root == nil

  right = deepest_node(root.right)
  left = deepest_node(root.left)

  case right[0] <=> left[0]
  when 0,1
    deepest = right
  when -1
    deepest = left
  end

  deepest[1] = root if deepest[1] == nil
  deepest[0] += 1
  deepest
end


# root = TreeNode.new(1)
# two = TreeNode.new(2)
# three = TreeNode.new(3)
# four = TreeNode.new(4)
# five = TreeNode.new(5)
# six = TreeNode.new(6)
#
#
#
# root.right = three
# root.left = two
# two.left = four
# two.right = five
# four.left = six
# puts deepest_node(root)


def symmetric_tree(root)
  symmetric_helper(root.left, root.right)
end

def symmetric_helper(left, right)
    if left == nil && right == nil
      true
    elsif left ^ right
      false
    elsif symmetric_helper(left.left, right.right) &&
          symmetric_helper(left.right, right.left)
          true
    else
      false
    end
end

# root = TreeNode.new(1)
# two = TreeNode.new(2)
# three = TreeNode.new(3)
# four = TreeNode.new(4)
# five = TreeNode.new(5)
# six = TreeNode.new(6)
#
#
#
# root.right = three
# root.left = two
# two.left = four
# two.right = five
# four.left = six
# puts symmetric_tree(root)

def get_deepest(node, depth = 0)
	return [nil, depth] if node == nil
	depth += 1
	left = get_deepest(node.left, depth)
	right = get_deepest(node.right, depth)

	if right[1]  >= left[1]
		deepest = right
	else
		deepest = left
  end

  deepest[0] = node if deepest[0] == nil
	deepest
end


root = TreeNode.new(1);
root.left = TreeNode.new(2);
root.right = TreeNode.new(3);
root.left.left = TreeNode.new(4);
root.right.left = TreeNode.new(5);
root.right.right = TreeNode.new(6);
root.right.left.right = TreeNode.new(7);
root.right.right.right = TreeNode.new(8);
root.right.left.right.left = TreeNode.new(9);
root.right.right.right.right = TreeNode.new(10);

puts return_deepest(root)
