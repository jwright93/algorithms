def fibonacci(n)


  return 1 if n == 1
  return 1 if n == 2

  fibonacci(n-1) + fibonacci(n -2)
end


def uncoupled_integer(array)

  sum = 0

  array.each do |num|
    sum ^= num
  end

  sum

end


# puts uncoupled_integer([1,1,2,5,2,3,3])


def balanced_braces(str)
  return false if str.length.odd?
  pairs = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }

  stack = []

  str.chars.each do |brace|
    if pairs[brace]
      stack << pairs[brace]
    else
      return false unless stack.pop == brace
    end
  end
  stack.empty?
end


def hamming_distance(x, y)
  answer = 0
  until x == 0 || y == 0
    answer += 1 if (x % 2) & (y % 2)
    x /= 2
    y /= 2
  end
  answer
end
