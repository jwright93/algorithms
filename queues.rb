def bTree_print(root)
  node = root
  q = Queue.new
  q.enqueue(node)

  until q.empty?
    q.dequeue
    q.enqueue(node.left) if node.left
    q.enqueue(node.right) if node.right
  end
  
end
