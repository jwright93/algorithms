def reverse_string(str)
  i = 0
  j = str.length - 1

  until i >= j
    str[i], str[j] = str[j], str[i]
    i += 1
    j -= 1
  end
  str
end


require 'set'
def duplicates(str)
  used = Set.new

  i = 0

  until str[i].nil?
    if used.include?(str[i])
      str[i] = ""
    else
      used << str[i]
      i += 1
    end
  end
  str

end

p duplicates('hoeedt')



def white_space(string)
  i = 0
  until string[i].nil?
    if string[i] == " "
      string[i] = ""
    else
      i += 1
    end 
  end
  string
end

def white_space(string)
  string.delete!(" ")
end
