# If a number is divisible by 3, return "Fizz". If a number is divisible by 5, 
# return "Buzz". If a number is divisible by 3 and 5, return "FizzBuzz" 

def fizzbuzz(x)
  fb = ""
  fb << "Fizz" if x % 3 == 0
  fb << "Buzz" if x % 5 == 0
  fb = x if fb == ""
  fb
end

# tests
assert_equal fizzbuzz(3), "Fizz"
assert_equal fizzbuzz(50), "Buzz"
assert_equal fizzbuzz(15), "FizzBuzz"
assert_equal fizzbuzz(5175), "FizzBuzz"
