# Problem 6.1 EPI

def dutch_flag_partition(arr, idx)
  arr[0], arr[idx] = arr[idx], arr[0]
  pivot = 0
  i =  1
  p arr
  until i == arr.length
    if arr[i] < arr[pivot]
      arr[i], arr[pivot + 1] = arr[pivot + 1], arr[i]
      arr[pivot], arr[pivot + 1] = arr[pivot + 1], arr[pivot]
    elsif arr[i] == arr[pivot]
      arr[i], arr[pivot + 1] = arr[pivot + 1], arr[i]
      pivot += 1;
    end
    i += 1
    p arr
  end
  arr
end

 a = [1,2,6,3,1]

  p dutch_flag_partition(a, 4)
