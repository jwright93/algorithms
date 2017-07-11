#chapter 1
#1.4

def palindrome_permutation(string)
  return true if string.length <= 2
  collection = Hash.new(0)
  odd_count = 0

  string.chars.each {|char| collection[char.downcase] += 1 unless char ==  " "}

  collection.each {|_,v| odd_count += 1 if v.odd?}
  odd_count > 1 ? false : true
end


#1.5

def one_away(str1, str2)
  return true if str1 == str2

  case str1.length <=> str2.length
  when 1
    insert(str1, str2)
  when 0
    replace(str1, str2)
  when -1
    insert(str2, str1)
  end
end

def replace(str1, str2)
  count = 0
  i = 0
  until i == str1.length
     count += 1 if str1[i] != str2[i]
     return false if count > 1
    i += 1
  end
  true
end

def insert(str1, str2)
  i = 0

  until i == str1.length
    if str1[i] != str2[i]
      str2 = str2[0...i] + str1[i] + str2[i..-1]
    end

    if str1 == str2
      return true
    else
      return false
    end
  end
  false
end

# puts one_away('bale', 'kale')
# puts one_away('ale', 'kale')
# puts one_away('ale', 'kald')
