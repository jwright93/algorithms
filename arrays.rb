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

def fizzbuzz(n)
  result = ''
  n.times do |i|
    if i % 3 == 0 && i % 5 == 0
      result += 'FizBuzz'
    elsif i % 3 == 0
      result += 'Fizz'
    elsif i % 5 == 0
      result += 'Buzz'
    else
      result += "#{i}"
  end
  result
end

  def smallest(arr1, arr2, arr3)
    i = 0
    j = 0
    k = 0


    while i < arr1.length && j < arr2.length && k < arr3.length
      return  arr1[i] if arr1[i] == arr2[j] && arr2[j] == arr3[k]

      case [arr1[i], arr2[j], arr3[k]].min
      when arr1[i]
        i += 1
      when  arr2[j]
        j += 1
      when arr3[k]
        k += 1
      end
    end
    return nil
  end

  arr1 = [1, 5, 10, 20, 40, 80]
  arr2 = [6, 7, 20, 80, 100]
  arr3 = [3, 4, 15, 20, 30, 70, 80, 120]

  p smallest(arr1, arr2, arr3)
