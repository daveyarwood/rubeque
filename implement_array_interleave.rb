#  Implement an Array method to interleave an array with a dynamic number of arguments or an array. 

class Array
  def interleave(*args)
    as = self
    bs = args.flatten
    cs = []
    
    until as.empty? and bs.empty?
      cs << as.shift unless as.empty?
      cs << bs.shift unless bs.empty?
    end
    
    cs
  end
end

# tests
assert_equal [1, 3, 5].interleave(2, 4, 6), [1, 2, 3, 4, 5, 6]
assert_equal [1, 3, 5].interleave([2, 4]), [1, 2, 3, 4, 5]
assert_equal [1, 3, 5].interleave("2", "4"), [1, "2", 3, "4", 5]
assert_equal [].interleave(2, 4, 6), [2, 4, 6]
assert_equal [1, 2, 3].interleave(), [1, 2, 3]
