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


def make_change(amt, coins = [1,5,10,25], cache = {0 => 0})
  return cache[amt] if cache[amt]
  return Float::INFINITY if amt < 0

  min_so_far = Float::INFINITY

  coins.each do |coin|
    current = make_change(amt - coin, coins, cache)
    min_so_far = current if current < min_so_far
  end

  return min_so_far if min_so_far == Float::INFINITY
  cache[amt] = min_so_far + 1
end



class Knapsack
  def initialize(weights, values, capacity)
    @weights = weights
    @values = values
    @cache = {}
    knapsack_helper(0, capacity)
  end

  def knapsack_helper(index, capacity)
    return -Float::INFINITY if capacity < 0
    return 0 if index == @weights.length
    return @cache[[index, capacity]] if @cache[[index, capacity]]

    first_case = knapsack_helper(index + 1, capacity)
    second_case = knapsack_helper(index + 1, capacity - @weights[index]) + @values[index]

    if first_case > second_case
      @cache[[index, capacity]] = first_case
    else
      @cache[[index, capacity]] = second_case
    end
  end
end


def generate(num_rows)
    return [1] if num_rows == 1
    return [1,1] if num_rows == 2

    previous = generate(num_rows - 1)
    current = []
    i = 0
    until i == previous.length - 1
        current << (previous[i] + previous[i+1])
        i += 1
    end

    [1] + current + [1]
end


def minimum_path_sum(grid)
  result = Array.new(grid.length) { Array.new(grid[0].length)}
  row_idx =  grid.length - 1
  col_idx= grid[0].length - 1
  result[row_idx][col_idx] = grid[row_idx][col_idx]

  until row_idx == 0
    col_idx = grid[0].length - 1
    until col_idx == 0
      if row_idx == grid.length - 1 && col_idx != grid[0].length - 1
        result[row_idx][col_idx] = result[row_idx][col_idx + 1] + grid[row_idx][col_idx]
      end

      if col_idx == grid[0].length - 1 && row_idx != grid.length - 1
        result[row_idx][col_idx] = result[row_idx][col_idx]
      end
      col_idx -= 1
    end
    row_idx -= 1
  end
  result[0][0]
end


def longest_common_subsequence(str1, str2)
  return 0 if str1.empty? || str2.empty?
  result = Array.new(str1.length + 1) { Array.new(str2.length + 1)}

  result.length.times do |i|
    result[i][0] = 0
  end

  result[0].length.times do |i|
    result[0][i] = 0
  end

  i = 1

  until i == result.length
    j = 1
    until j == result[0].length
      if str1[i] == str2[j]
        result[i][j] =  result[i - 1][j - 1] + 1
      else
        result[i][j] = [result[i][j-1], result[i-1][j-1]].max
      end

      j += 1
    end
    i += 1
  end
  result[i-1][j-1]
end


p longest_common_subsequence('abced', 'acefg');
