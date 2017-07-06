require 'set'
# 1.1

def unique_characters(word)
  # 0(n) time complexity o(n) space complexity
  # collected = Set.new
  # i = 0
  # until i == word.length
  #   return false if collected.include?(word[i])
  #   collected << word[i]
  #   i += 1
  # end
  #
  # true

  # 0(nlogn) time complexity o(1) space complexity

  letters = word.dup.chars.sort

  i = 0

  until i == letters.length - 1
    return false if letters[i] == letters[i + 1]
    i += 1
  end

  true

end


def string_permutation(str1, str2)
  # 0(nlogn) time complexity o(1) space complexity
  # return false if str1.length != str2.length
  #
  # str1.chars.sort == str2.chars.sort
  #
  #

  return false if str1.length != str2.length
  count1 = Hash.new(0)
  count2 = Hash.new(0)
  # 0(n) time complexity o(n) space complexity

  str1.chars.each do |letter|
    count1[letter] += 1
  end

  str2.chars.each do |letter|
    count2[letter] += 1
  end

  count1 == count2

end

def string_compression(string)
  result = ''
  count = 1
  i = 1

  until i == string.length
    if string[i] == string[i - 1]
      count+= 1
    else
      result += "#{string[i-1]}#{count}"
      count = 1
    end
    i += 1
  end
  result += "#{string[string.length - 1]}#{count}"
  result.length <= string.length ? result : string
end


class LinkNode
  attr_accesor :data, :prev, :next
  def initialize(data)
    @data = data
    @prev = nil
    @next = nil
  end
end

## 2.2

def kth_last_element(head, k)

  point1 = head
  point2 = head

  k.times do |i|
    point1 = point1.next
  end

  until point1.next == nil
    point1 = point1.next
    point2 = point2.next
  end

  point2
end
