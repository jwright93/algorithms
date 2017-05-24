# 8.1

class MaxStack

  def initialize(input)
    @main = [input]
    @max_value = [input]
  end

  def push(input)
    @main << input
    if @max_value.last < input
       @max_value << input
    else
      @max_value << @max_value.last
    end
    @main.last
  end

  def pop
    raise 'stack is currently empty' if @main.empty?
    @max_value.pop
    @main.pop
  end

  def max
    @max_value.last
  end
end
