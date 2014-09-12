#  Find all of the prime factors for a given number 

def prime_factors(num)
  factors = []
  n = num
  x = 2
  
  while n > 1
    while n % x == 0
      factors << x
      n /= x
    end
    x += 1
  end
  
  factors.uniq
end

# tests
assert_equal prime_factors(102), [2, 3, 17]
assert_equal prime_factors(896680), [2, 5, 29, 773]
assert_equal prime_factors(42), [2, 3, 7]
