class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList < Node
  include Enumerable
  attr_accessor :head, :tail

  def initialize
    @tail, @head = Node.new, Node.new
    @tail.prev = @head
    @head.next = @tail

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if self.empty?
    self.head.next
  end

  def last
    return nil if self.empty?
    self.tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    self.tail.prev.next = node
    node.prev = self.tail.prev
    node.next = self.tail
    self.tail.prev = node
  end

  def update(key, val)

  end

  def remove(key)
  end

  def each
    queue = [self.first]
    until queue.empty?
      node = queue.pop
      yield node
      queue << node.next unless node.next.val == nil
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
