# Implement an array method that returns duplicates. It should also optionally 
# take a block to call as criteria for determining duplicates.

class Array
  def duplicates(&block)
    up_til_now, dups = [], []
    each do |x|
      y = block_given? ? (yield x) : x
      if up_til_now.include? y
        dups << x
      else
        up_til_now << y
      end
    end
    dups
  end
end

# tests
a = ["a", "b", "c", "b", "d", "a", "d"]
b = [1, 2, 3, 4, 5, 6, 7, 8]
c = [nil, 8, nil, "c", 5, :c, :k, (4 + 4)]

assert_equal a.duplicates, ["b", "a", "d"]
assert_equal b.duplicates, []
assert_equal b.duplicates {|e| e.even?}, [3, 4, 5, 6, 7, 8]
assert_equal c.duplicates {|e| e.to_s}, [nil, :c, 8]

