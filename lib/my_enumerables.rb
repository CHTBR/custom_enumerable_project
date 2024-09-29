module Enumerable
  # Your code goes here
  def my_each
    self.size.times do |index|
      yield(self[index])
    end
    self
  end

  def my_select
    matching = []
    self.my_each do |element|
      matching << element if yield(element)
    end
    matching
  end

  def my_each_with_index
    self.size.times do |index|
      yield(self[index], index)
    end
    self
  end

  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    return self.size unless block_given?
    count = 0
    self.my_each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    tmp_arr = []
    self.my_each do |element|
      tmp_arr << yield(element)
    end
    tmp_arr
  end

  def my_inject(initial_value)
    acc = initial_value
    self.my_each do |element|
      acc = yield(acc, element)
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
    self.size.times do |index|
      yield(self[index])
    end
    self
  end
end
