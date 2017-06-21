# def merge_sort(array)
#    return array if array.count < 2
#
#    middle = array.count / 2
#
#    left, right = array.take(middle), array.drop(middle)
#    sorted_left, sorted_right = left.merge_sort, right.merge_sort
#
#    merge(sorted_left, sorted_right)
#  end
#
#  def merge(left, right)
#    merged_array = []
#    until left.empty? || right.empty?
#      merged_array <<
#        ((left.first < right.first) ? left.shift : right.shift)
#    end
#
#    merged_array + left + right
#  end


def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2

  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid...-1])

  merge(left, right)
end


def merge(left, right)
  result = []

  until left.empty? || right.empty?
    if left.first < right.first
      result << left.shift
    else
      result << right.shift
    end
  end

  result + right + left
end
