class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    
    self.join.to_i.to_s(2).to_i
    # self.each_with_index do |(ele, i)|
    #   (ele.hash, i.hash)

    # end
  end
end

class String
  def hash
    arr = self.split("").map {|char| char.ord}
    arr.join.to_id
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    0
  end
end
