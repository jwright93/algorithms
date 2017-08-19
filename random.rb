require 'byebug'
require 'set'

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
  until x == 0 && y == 0
    answer += 1 if (x % 2) & (y % 2)
    x /= 2
    y /= 2
  end
  answer
end


def number_compliment(num)
  answer = ''
  until num == 0
    num % 2 == 0 ? answer =  '1' + answer : answer =  '0' + answer
    num /=2
  end

  answer.to_i(2)
end


def reverse_vowels(string)
  vowels = Set.new(['a', 'e', 'i', 'o','u'])

  i = 0
  j = string.length

  until i >= j
    if vowels.include?(string[i]) && vowels.include?(string[j])
      string[i], string[j] = string[j], string[i]
      i += 1
      j -= 1
    else
      i += 1 if !vowels.include?(string[i])
      j -= 1 if !vowels.include?(string[j])
    end
  end
  string
end


def string_decompression(string)
  i = 0
  result = ''
  until i >= string.length
    string[i + 1].to_i.times do
      result += string[i]
    end
    i += 2
  end
  result
end

# puts string_decompression('a4b2c1')


def sum_to(nums)
  collection = Set.new
  result = []

  nums.each do |num|
    if collection.include?(num)
      result << [(100 - num), num]
    else
      collection << (100 - num)
    end
  end

  result
end


def parens(str)
  stack = []

  str.chars.each do |char|
    if char == '('
      stack << ')'
    else
      return false unless stack.pop == char
    end
  end

  stack.empty?
end


def braces(str)
  stack = []

  pairs = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }

  str.chars.each do |char|
    if pairs[char]
      stack << pairs[char]
    else
      return false unless stack.pop == char
    end
  end

  stack.empty?
end


def max_number(arr1, arr2)

  result = []

  until arr1.empty? || arr2.empty?
    if arr1.first > arr2.first
      result << arr1.shift
    elsif arr1.first < arr2.first
      result << arr2.shift
    else
      i = 0
      until arr1[i] != arr2[i]
        i +=1
      end

      if arr1[i].nil?
        result + arr1.shift(i)
      elsif  arr2[i].nil?
        result + arr2.shift(i)
      else

      end
    end
  end

  (result + arr1 + arr2).to_i

end


def num_islands(grid)

    islands = 0
    rows = grid.length
    cols = grid[0].length
    rows.times do |row|
        cols.times do |col|
            if grid[row][col] == '1'
                islands += 1
                dfs_check(grid, row, col)
            end
        end
    end

    islands
end

def dfs_check(grid, row, col)
    return nil if row < 0 || row >= grid.length || col < 0 || col >= grid[0].length || grid[row][col] != '1'
        grid[row][col] = '0'
        dfs_check(grid, row + 1, col)
        dfs_check(grid, row - 1, col)
        dfs_check(grid, row, col + 1)
        dfs_check(grid, row, col - 1)
end

# grid = ["11110","11010","11000","00000"]
# p num_islands(grid)


def license_key_formatting(s, k)
    s = s.upcase.delete('-')

    i = s.length - 1

    until i < 0
        k.times do
            i-= 1
        end
        s[i] += '-' if i >= 0
    end

    s

end


def judge_circle(moves)
    horizontal = 0
    vertical = 0

    moves.chars.each do |move|
        if move == 'R'
            horizontal += 1
        elsif move == 'L'
            horizontal -= 1
        elsif move == 'U'
            vertical += 1
        elsif move == 'D'
            vertical -= 1
        end
    end

    horizontal == 0 && vertical == 0
end
