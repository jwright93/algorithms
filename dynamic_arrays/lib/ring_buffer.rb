require_relative "static_array"
# require "pry"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    index_ref = (index + @start_idx) % @capacity
    @store[index_ref]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    index_ref = (index + @start_idx) % @capacity
    @store[index_ref] = value
  end

  def pop
    raise "index out of bounds" if @length == 0
    pop_val = self[@length -1]
    self[@length -1] = nil
    @length -= 1
    pop_val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @length += 1
    self[@length - 1] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    shift_val = self[0]
    # self[0] = nil
    @start_idx += 1
    @length -= 1
    shift_val
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @start_idx -= 1
    @length += 1
    self[0] = val
    val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= length
  end

  def resize!
    new_store = StaticArray.new(@capacity*2)

    @length.times do |i|
      new_store[i] = self[i]
    end

    @capacity *= 2
    @store = new_store
    @start_idx = 0
  end
end
