def binary_search(array, target)
  #base case
  return nil if array.empty?

  index = array.length / 2

  case target <=> array[index]
  when -1
    binary_search(array[0...index], target)
  when 0
    return index
  when 1
    result = binary_search(array[(index + 1)..-1],target)
      result ? index + 1 + result : nil
  end

end
