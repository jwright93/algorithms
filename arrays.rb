# # Problem 6.1 EPI
#
# def dutch_flag_partition(arr, idx)
#   arr[0], arr[idx] = arr[idx], arr[0]
#   pivot = 0
#   i =  1
#   p arr
#   until i == arr.length
#     if arr[i] < arr[pivot]
#       arr[i], arr[pivot + 1] = arr[pivot + 1], arr[i]
#       arr[pivot], arr[pivot + 1] = arr[pivot + 1], arr[pivot]
#     elsif arr[i] == arr[pivot]
#       arr[i], arr[pivot + 1] = arr[pivot + 1], arr[i]
#       pivot += 1;
#     end
#     i += 1
#     p arr
#   end
#   arr
# end
#
#
# def fizzbuzz(n)
#   result = ''
#   n.times do |i|
#     if i % 3 == 0 && i % 5 == 0
#       result += 'FizBuzz'
#     elsif i % 3 == 0
#       result += 'Fizz'
#     elsif i % 5 == 0
#       result += 'Buzz'
#     else
#       result += "#{i}"
#   end
#   result
# end
#
# def smallest(arr1, arr2, arr3)
#   i = 0
#   j = 0
#   k = 0
#
#
#   while i < arr1.length && j < arr2.length && k < arr3.length
#     return  arr1[i] if arr1[i] == arr2[j] && arr2[j] == arr3[k]
#
#     case [arr1[i], arr2[j], arr3[k]].min
#     when arr1[i]
#       i += 1
#     when  arr2[j]
#       j += 1
#     when arr3[k]
#       k += 1
#     end
#   end
#   return nil
# end
#
#
# def find_max_consecutive_ones(nums)
#     current = 0
#     max = 0
#     nums.each do |num|
#         if num == 1
#             current += 1
#             max = current if current >= max
#         else
#             current = 0
#         end
#     end
#
#     max
# end
#
#
#
# def single_number(nums)
#     result  = 0
#     nums.each do |num|
#         result ^= num
#     end
#
#     result
#
# end
#
#
# def find_the_difference(s, t)
#   count_s = 0
#   count_t = 0
#   s.chars.each do |letter|
#       count_s += letter.ord
#   end
#
#   t.chars.each do |letter|
#       count_t += letter.ord
#   end
#
#   (count_t - count_s).chr
# end
#
#
# def subsets(array)
#   return [[]] if array.empty?
#
#   previous = subsets(array[1..-1])
#   first = array.first
#   previous.concat(previous.map {|set| [first] + set})
#
#
# end
#
#
#
# def group_two(arr)
# 	collection = Hash.new(Array.new)
# 	arr.each do |word|
# 		 collection[word[-2..-1]] += [word]
# 	end
#
# 	collection.values.flatten
# end
#
# arr = ["top", "bat", "hop", "rot", "sat", "food"]
#
# p group_two(arr)


def sub_arrays(arr, n)
	return arr if arr.length < n
	result = []
	i = 0

	until i == arr.length
		current_arr = []
		count = 0
		until count == n || i == arr.length
			current_arr << arr[i]
			count += 1
			i += 1
		end
		result << current_arr
	end
	result
end
