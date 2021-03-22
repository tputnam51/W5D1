class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if self.include?(key)
    self[key.hash] << key
    self.count += 1
    resize! if self.count > num_buckets
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self.count -= 1 if self[key.hash].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    self.count = 0
    new_store = self.store
    num = num_buckets

    self.store = Array.new(num * 2) { Array.new }
    new_store.flatten.each do |ele|
      insert(ele)
    end
  end
end
