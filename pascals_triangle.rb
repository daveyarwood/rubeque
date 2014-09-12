# Write a method that will return the nth row of Pascal's Triangle.

def pt(n)
  return [1] if n == 0
  return [1, 1] if n == 1
  [1] + pt(n-1)[1..-1].each_with_index.map{|x,i| x + pt(n-1)[i]} + [1]
end

# tests
assert_equal pt(0), [1]
assert_equal pt(1), [1, 1]
assert_equal pt(2), [1, 2, 1]
assert_equal pt(3), [1, 3, 3, 1]
assert_equal pt(4), [1, 4, 6, 4, 1]
