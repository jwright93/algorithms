def bsearch(array, target)
  return nil if array.length < 1

  mid = array.length / 2

  case target <=> mid
  when 1
    previous = bsearch(array[mid +1..-1], target)
    if previous != nil
      previous + 1 + mid
    else
      nil
    end
  when 0
    mid
  when -1
    bsearch(array[0...mid], target)
  end

end


puts bsearch([1,2,3,4,5], 1)
puts bsearch([1,2,3,4,5], 0)
puts bsearch([1,2,3,4,5], 6)
puts bsearch([1,2,3,4,5], 4)
