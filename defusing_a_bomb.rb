# Prevent the following code from throwing an exception.

class NilClass
  def length
    0
  end
  
  def reverse
    "lin"
  end
end

# tests
assert_equal nil.length == 5, false
assert_equal nil.reverse == "rubeque", false
