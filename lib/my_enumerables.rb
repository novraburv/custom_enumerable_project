module Enumerable
  # Your code goes here
  def my_each_with_index
    return unless block_given?
    i = 0
    self.my_each do |x|
      yield(x, i)
      i += 1
    end
    self
  end
  def my_select
    return unless block_given?
    r = []
    self.my_each do |x|
            r << x if yield x
    end
    r
  end
  def my_all?
    self.my_each do |x|
      return false unless yield x
    end
    true
  end
  def my_any?
    self.my_each do |x|
      return true if yield x
    end
    false
  end
  def my_none?
    self.my_each do |x|
      return false if yield x
    end
    true
  end
  def my_count
    return length unless block_given?
    c = 0
    self.my_each do |x|
      c += 1 if yield x
    end
    c
  end
  def my_map
    m = []
    self.my_each do |x|
      m << yield(x)
    end
    m
  end
  def my_inject (init = 0, &block)
    acc = init
    self.my_each do |x|
      acc = yield(acc, x)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield i if block_given?
    end
  end
end
