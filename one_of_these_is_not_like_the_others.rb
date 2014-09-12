# One of these is not like the others. Write a method that will return the one 
# that doesn't match. 

class Object
  def type
    [TrueClass, FalseClass].include?(self.class) ? :boolean : self.class
  end
end

def nonmatching(a)
  types = a.map{|x| x.type}
  a.find {|x| types.select {|type| type == x.type}.count == 1}
end

# tests
assert_equal nonmatching([1, 2, 3, 4.0, 5, 6]), 4.0
assert_equal nonmatching(["ichi", "visitor q", 13, "assassins"]), 13
assert_equal nonmatching([/2001/, "full metal jacket", /paths of glory/]), "full metal jacket"  
assert_equal nonmatching([true, false, nil, (1==1)]), nil
