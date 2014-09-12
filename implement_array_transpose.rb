# Re-implement Ruby's Array#transpose.

class Array
  def transpose
    return [] if empty?

    sorted = self.sort_by(&:size).reverse
    answer = []
    sorted[0].size.times do |i|
      a = []
      self.each {|ary| a << ary[i] if ary[i]}
      answer << a
    end
    answer
  end
end

#  tests
assert_equal [[1, 2, 3], [:a, :b, :c]].transpose, [[1, :a], [2, :b], [3, :c]]
assert_equal [[1,2], [3,4], [5,6]].transpose, [[1, 3, 5], [2, 4, 6]]
assert_equal [].transpose, []
