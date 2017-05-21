def merge(l, f)
  m = ListNode.new
  tail = m

  until l.nil? || f.nil?
    if l.value > r.value
      tail.next = r
      r = r.next
    else
      tail.next = l
      l = l.next
    end
    tail = tail.next
  end

  l.nil? ? tail.next = r : tail.next = l
  m.next
end

def cyclic(first_link)
  # naive solution O(n) space complexity
  visited = Set.new
  current = first_link

  until current.nil?
    return current if visited.include?(current)
    visited << current
    current = current.next
  end

  nil
end

def cyclic2(first_link)

  slower_runner = first_link
  faster_runner = first_link

  while true
    2.times do
      faster_runner = faster_runner.next
      return nil if faster_runner.nil?
      return faster_runner if faster_runner == slower_runner
    end

    slower_runner = slower_runner.next
end
