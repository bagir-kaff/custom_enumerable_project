module Enumerable
  # Your code goes here

  def my_each_with_index
    i=0
    self.my_each do |n|
      yield(n,i)
      i+=1
    end

    return self
  end

  def my_select
    ok_array=[]
    self.my_each { |n|  ok_array << n if yield n }
    return ok_array
  end

  def my_all?
    self.my_each { |n| return false unless yield(n) }
    return true
  end

  def my_any?
    self.my_each { |n| return true if yield n}
    return false
  end

  def my_none?
    self.my_each { |n| return false if yield n }
    return true
  end

  def my_count(num=nil)
    counter = 0
    if !num.nil?
      self.my_each { |n| counter+=1 if n == num}
      return counter
    elsif block_given?
      self.my_each { |n| counter+=1 if yield n}
      return counter
    else
      return self.length
    end
  end

  def my_map
    new_array = []
    self.my_each { |n| new_array << yield(n)}
    return new_array
  end
  def my_inject(initial_value=nil)
    initial_value = self[0] if initial_value.nil?
    self.my_each{ |n| initial_value = yield(initial_value,n)}
    return initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    length = self.length
    i=0
    while i<length do
        yield self[i]
        i+=1
    end
    return self
  end
end


# p [1,2,3,4,5].my_inject { |sum,n| sum+n}
