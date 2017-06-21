def in_order(root)
  return nil unless root

    in_order(root.left)
    p root
    in_order(root.right)
end

def pre_order(root)
  return nil unless root
  p root
  pre_order(root.left)
  pre_order(root.right)

end

def post_order(root)
  return nil unless root
  post_order(root.left)
  post_order(root.right)
  p root
end
