require "byebug"

class Array
  def my_uniq
    uniq = []
    self.each do |el|
      uniq << el unless uniq.include?(el)
    end
    uniq
  end
  
  def two_sum
    result = []
    self.each_with_index do |el1, idx1|
      (idx1 + 1...self.length).each do |idx2|
        result << [idx1, idx2] if (self[idx1] + self[idx2]).zero?
      end
    end
    result
  end
  
  def my_transpose
    result = []
    self.length.times { result << [] }
    self.each do |row|
      row.each_with_index do |el, idx|
        result[idx] << el
      end
    end
    result
  end
  
  def stock_picker
    # debugger
    result = [0, 1]
    profit = self[result[1]] - self[result[0]]
    self.each_with_index do |el, idx1|
      (idx1 + 1...self.length).each do |idx2|
        if profit < (self[idx2] - self[idx1])
          result = [idx1, idx2]
          profit = self[idx2] - self[idx1]
        end
      end
    end
    result
  end
end

class TowerOfHanoi
  attr_reader :tower 
  def initialize
    @tower = [[1, 2, 3], [], []]
  end
  
  def move(start, end)
    raise ArgumentError unless start.between?(0, 2)
    raise ArgumentError unless end.between?(0, 2)
    raise ArgumentError if @tower[start].empty?
    
    ring = @tower[start].shift
    @tower[end].unshift(ring)
  
  end
end













