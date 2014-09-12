# Any number can be written as a product of prime numbers. For example, 
# 42 would be "2 * 3 * 7" while 44 would be "2 * 2 * 11". Write a function to 
# return an array of prime factors in ascending order for a given number. 

def prime_factorization(num)
  prime =  Enumerator.new do |y|
    mem = []
    is_prime = lambda { |e| mem.find { |_| e.gcd(_) != 1 } }
    2.upto(num) do |n|
      unless is_prime[n]
        mem << n
        y << n
      end
    end
  end
 
  o = []
  loop do
    n = prime.next
    if num % n == 0
      num /= n
      o << n
      prime.rewind
    end   
  end
  o
end

# tests
assert_equal prime_factorization(42), [2, 3, 7]
assert_equal prime_factorization(44), [2, 2, 11]
assert_equal prime_factorization(75), [3, 5, 5]
assert_equal prime_factorization(123456), [2, 2, 2, 2, 2, 2, 3, 643]
