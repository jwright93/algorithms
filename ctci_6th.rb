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

# 1.6

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

# 1.7 rotate matrix

# O(n^2) time and space

def rotate_matrix(mat)
  mat.reverse!
  mat.transpose
end

def own_transpose(mat)
  result = Array.new(mat.length) { Array.new(mat.length)}

  col = 0

  until col == mat.length
    row = 0
    until row == mat.length
      result[col][row] = mat[row][col]
      row += 1
    end
    col += 1
  end
  result
end

# 1.8
def zero_matrix(mat)
  rows = Set.new
  cols = Set.new

  row = 0

  until row == mat.length
    col = 0
    until col == mat[0].length
      if mat[row][col] == 0
        rows << row
        cols << col
      end
      col += 1
    end
    row += 1
  end

  rows.each do |row|
    zero_row(row,mat)
  end

  cols.each do |col|
    zero_col(col, mat)
  end
end

def zero_row(row, mat)
  length = mat[0].length
  col = 0

  until col == length
    mat[row][col] = 0
    col += 1
  end
  mat
end

def zero_col(col, mat)
  length = mat.length
  row = 0

  until row == length
    mat[row][col] = 0
    row += 1
  end

  mat
end



########################

# 2 Linked List

class ListNode
  attr_accessor :val, :next
  def initialize(val = nil)
    @val = val
    @next = nil
  end
end

# 2.1

def list_dups(head)
  collected = Set.new
  current = head

  until current == nil
    if collected.include?(current)
      prev = current.prev
      next_node = current.next
      prev.next = next_node
      next_node.prev = prev if next_node
    else
      collected.prev
    end

    current = current.next
  end
  head
end


# 2.2

def k_to_last(head)
  runner = head
  current = head

  k.times do
    if runner
      runner = runner.next
    else
      break
    end
  end

  return nil unless runner

  until runner == nil
    runner = runner.next
    current = current.next
  end
  current
end


################################################################

# Trees and Graphs

class TreeNode
  attr_accessor :val, :right, :left

  def initialize(val = nil)
    @val = val
    @right = right
    @left = left
  end
end

# 4.1

def node_routes(graph, start, ending)
  visited = Set.new([start])
  queue = [start]

  until queue.empty?
    current = queue.shift

    if current == ending
      return true
    end

    current.adjacent.each do |node|
      unless visited.include?(node)
        visited << node
        queue << node
      end
    end
  end

  false
end


# 4.2

def minimal_tree(array, tree = nil)
  return nil if array.empty?
  mid = array.length / 2

  node = TreeNode.new(array[mid])
  node.left = minimal_tree(array[0...mid])
  node.right = minimal_tree(array[(mid + 1)..-1])
  node
end


# 4.3

def list_of_depth(node)
  result = []
  queue = [node]

  until queue.empty?
    head = ListNode.new(0)
    result << head
    list_size = queue.length
    list_size.times do
        current = queue.shift
        unless current.left == nil
          head.next = ListNode.new(current.left)
          head = head.next
          queue << current.left
        end

        unless current.right == nil
          head.next = ListNode.new(current.right)
          head = head.next
          queue << current.right
        end
    end
  end

  result
end

def level_order(root)
    return [] unless root
    queue = [root]
    result = [[root.val]]

    until queue.empty?
        level = []
        size = queue.length
        size.times do
            node = queue.shift
            if node.left
                level.push(node.left.val)
                queue.push(node.left)
            end
            if node.right
                level.push(node.right.val)
                queue.push(node.right)
            end
        end
        result << level unless level.empty?
    end
    result
end
