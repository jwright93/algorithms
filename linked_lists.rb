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
