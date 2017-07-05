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
