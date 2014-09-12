# Implement Array#uniq 

class Array
  def uniq(&block)
    unique = []
    results = []
    self.each do |x|
      unless results.include?(block.call(x))
        unique << x
        results << block.call(x)
      end
    end
    unique
  end
end

# tests
class Programmer
  def initialize(name)
    @name = name
  end
  attr_accessor :name
end

programmers = [Programmer.new("David"), Programmer.new("Joe"), Programmer.new("Michael"), 
  Programmer.new("Kamal"), Programmer.new("david")]

assert_equal programmers.uniq {|u| u.name.downcase}, programmers[0..3]
assert_equal [1.1, 2.1, 1.5, 3.1, 6, 2].uniq {|x| x.to_i}, [1.1, 2.1, 3.1, 6]
assert_equal [3, 6, 9, 2, 4, 8, 33, 1].uniq {|i| i.remainder(3)}, [3, 2, 4]
