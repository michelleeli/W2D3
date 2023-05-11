# Write a method, least_common_multiple, that takes in two numbers and returns
# the smallest number that is a mutiple of both of the given numbers
def least_common_multiple(num_1, num_2)
  multiple = num_1 * num_2 
  (1..multiple).each do |num|
    return num if (num % num_1 == 0) && (num % num_2 == 0)
  end 
end


# Write a method, most_frequent_bigram, that takes in a string and returns the
# two adjacent letters that appear the most in the string.
def most_frequent_bigram(str)
  counter = Hash.new(0)
  str.each_char.with_index do |char, idx|
    if idx < str.length - 1 
      bigram = char + str[idx + 1]
        counter[bigram] += 1
    end 
  end 
  sorted = counter.sort_by {|k,v| v} 
  sorted[-1][0]
end


class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value
  # pairs are swapped
  def inverse
    newhash = {}
    self.each { |k,v| newhash[v] = k}
    newhash  
  end

end


class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns
  # the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    count = 0
    self.each_with_index do |ele1, idx1|
      self.each_with_index do |ele2, idx2|
        count += 1 if idx1 < idx2 && ele1 + ele2 == num
      end 
    end 
    count
  end


  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort commonly accept a block. That block
  # accepts two parameters, which represents the two elements in the array being
  # compared. If the block returns 1, it means that the second element passed to
  # the block should go before the first (i.e., switch the elements). If the
  # block returns -1, it means the first element passed to the block should go
  # before the second (i.e., do not switch them). If the block returns 0 it
  # implies that it does not matter which element goes first (i.e., do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b}
    
    sortable = true
    
    while sortable
      sortable = false 

      self.each_with_index do |ele, idx|
        if idx < self.length - 1 && prc.call(ele, self[idx + 1]) == 1
          self[idx] , self[idx + 1] = self[idx + 1] , self[idx]
          sortable = true
        end 
      end 
    end 

    self
  end

end