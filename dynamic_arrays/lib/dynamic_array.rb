require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @store[@length -1 ] = nil
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    i = 0
    shift_val = @store[0]
    until i == @length
      @store[i] = @store[i + 1]
      i+=1
    end
    @length -= 1
    shift_val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    i = @length
    until i == 0
      @store[i] = @store[i -1]
      i -=1
    end
    @store[0] = val
    @length +=1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= length || index < 0
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    # @capacity *= 2 if @capacity == @length
    new_store = StaticArray.new(@capacity*2)

    @length.times do |i|
      new_store[i] = @store[i]
      i+=1
    end

    @capacity *= 2
    @store = new_store
  end
end
