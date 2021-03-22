class MaxIntSet

  attr_reader :store
  def initialize(max)
      @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
      @store[num] = false
  end

  def include?(num)
    return false unless @store[num] == true
    true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    return num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    self.count += 1

    if self.count > num_buckets
      resize!
    end
  end

  def remove(num)
     self.count -= 1 if self[num].delete(num)
   
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    self.store.length
  end

  def resize!
     
      self.count = 0
      new_store = self.store
      num = num_buckets
      self.store = Array.new(num * 2) { Array.new }

      new_store.flatten.each do |n|
        insert(n)
      end
      new_store
  end
end
