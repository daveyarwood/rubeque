# Re-implement Ruby's each method without using each (or for, which is really 
# just each). 

class Array
  def each
    x = 0
    self.count.times do 
      yield(self[x])
      x += 1
    end
    self
  end
end

# tests
a = [rand, rand, rand]
assert_equal a.each{}, a

b = []
a.each { |e| b << e }
assert_equal a, b
