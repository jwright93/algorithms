def quick_sort(array)
  return array if array.length <= 1
  val = array[0]
  right = []
  left = []

  array.each_index do |i|
    next if i == 0
    if val > array[i]
        left << array[i]
    else
        right << array[i]
    end
  end

  quick_sort(left) + [val] + quick_sort(right)

end


def qs_in_place(array, start = 0, length = array.length)
  return array if length <= 1

  pivot_idx = partition(array, start, length)
  left_length =  pivot_idx - start
  right_length = length - (left_length + 1)

  qs_in_place(array, start, left_length)
  qs_in_place(array, pivot_idx + 1, right_length)

  array
end

def partition(array, start, length)
  pivot_idx = start
  pivot = array[start]

  ((start +1)...(start + length)).each do |idx|
    if pivot >= array[idx]
      array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
      pivot_idx += 1
    end
  end

  array[start], array [pivot_idx] = array[pivot_idx], array[start]
  pivot_idx
end


puts qs_in_place([4,1,5,21,6,3,1,6,3])
