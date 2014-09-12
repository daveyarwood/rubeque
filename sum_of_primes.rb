# Write some code to sum the first 1000 primes without using Ruby's Prime class.

def prime?(n)
  (2..(Math.sqrt(n).floor)).each do |i|
    return false if (n % i).zero?
  end
  true
end
  
def sum_primes(nth_prime)
  primes, n = [], 1
  until primes.length == nth_prime
    n += 1
    primes << n if prime?(n)
  end
  primes.inject(0) { |a, e| a + e }
end

# tests
assert_equal 3682913, sum_primes(1000)
assert_equal 111587, sum_primes(200)
