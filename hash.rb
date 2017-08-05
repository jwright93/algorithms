require 'byebug'

class MyHash
  attr_reader :buckets

  def intitialize
    @buckets = []
  end

  def insert(k,v)
    index = assign_find_key(k)
    buckets[index] ||= []
    buckets[index] << [k,v]
  end

  def find(k)
    index = assign_find_key(k)

    buckets[index].each do |pair|
      return pair[1] if pair[0] == k
    end
  end

  def symbolize_key(k)
    k = k.to_sym
    k.object_id
  end

  def assign_find_key(k)
    symbolize_key(k) % 100
  end

end


def bomb_check(grid, row, col, enemies = 0)
    debugger
    return enemies if row < 0 || col < 0 || row >= grid.length || col >= grid[0].length || grid[row][col] == 'W'
    enemies += 1 if grid[row][col] == 'E'
    top = bomb_check(grid, row + 1, col, enemies)
    bottom = bomb_check(grid, row - 1, col, enemies)
    left = bomb_check(grid, row, col - 1, enemies)
    right = bomb_check(grid, row, col + 1, enemies)

    enemies += (top + bottom + left + right)

end

grid = ["0E00","E0WE","0E00"]

bomb_check(grid, 0, 0)
