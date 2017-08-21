class LRU_Cache
  def initialize(max_items = 10)
      @max_items = max_items
      @head = nil
      @tail = nil
      @count = 0
      @table = {}
  end

  def set(key, value)
    @count += 1
    @head = @head.next if @count > max_items

    new_node = Node.new(value)

    @head = new_node if tail == nil
    @tail.next = new_node if @tail != nil
    @tail  = new_node
    @table[key] = value
  end

  def get(key)
    # res = @table[key]
    # return res if res.next == nil
    #
    # if res.previous != nil
    #   r
    # end
  end
end


class Node
  def initialize(value = nil)
    attr_accessor :value, :prevous, :next
    @value = value
    @previous = nil
    @next = nil
  end
end
