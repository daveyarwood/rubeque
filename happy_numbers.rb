# Happy numbers are positive integers that follow a particular formula: 
# take each individual digit, square it, and then sum the squares to get a new number. 
# Repeat with the new number and eventually, you might get to a number whose squared sum is 1. 
# This is a happy number. An unhappy number (or sad number) is one that loops endlessly. 
# Write a function that determines if a number is happy or not. 

def happy_number?(n)
  cache = []
  x = n

  until cache.include?(x) or x == 1
    cache << x
    digits = x.to_s.chars.map(&:to_i)
    x = digits.inject(0){|sum, digit| sum + digit**2}
  end

  x == 1
end

# tests
assert_equal happy_number?(7), true
assert_equal happy_number?(986543210), true
assert_equal happy_number?(2), false
assert_equal happy_number?(189), false
