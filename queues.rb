# 8.9

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


# 8.10

class Queue
  attr_reader :queue

  def initialize(capacity)
    @queue = Array.new(capacity)
    @capacity = capacity
    @start = 0
    @count = 0
  end

  def size
    @count - @start
  end

  def enqueue(value)
    @queue[@count] = value
    @count += 1
    resize! if @count == @capacity
  end

  def dequeue
    element = @queue[start]
    @start += 1
    element
  end

  private

  def resize!
    @capacity = @capacity*2
    new_queue = Array.new(@capacity)
    i = 0
    until @start == @count
      new_queue[i] = @queue[@start]
      i += 1
      @start += 1
    end
    @queue = new_queue
    @start = 0
  end

end
