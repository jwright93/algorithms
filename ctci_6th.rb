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


puts palindrome_permutation("Tact Coa")
