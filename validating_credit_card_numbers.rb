# Credit card numbers can be validated with a process called the Luhn algorithm. 
# Simply stated, the Luhn algorithm works like this:

#    Starting with the next to last digit and continuing with every other digit 
#    going back to the beginning of the card, double the digit.
#
#    Sum all doubled and untouched digits in the number.
#
#    If that total is a multiple of 10, the number is valid.

# For example, given the card number 4408 0412 3456 7893:

# Orig  :  4 4 0 8 0 4 1 2 3 4   5 6   7 8   9 3
# Step 1:  8 4 0 8 0 4 2 2 6 4  10 6  14 8  18 3
# Step 2:  8+4+0+8+0+4+2+2+6+4+1+0+6+1+4+8+1+8+3 = 70
# Step 3:  70 % 10 == 0

# This card is valid!

def valid_credit_card?(num)
  num = num.split('').map(&:to_i)
  step_1 = num.reverse.each_with_index.map{|x,i| i.odd? ? x*2 : x}.reverse
  num = step_1.join.split('').map(&:to_i)
  step_2 = num.inject{|x,y| x + y}
  step_3 = step_2 % 10 == 0
  return step_3
end

# tests
assert_equal valid_credit_card?("1234567890123456"), false
assert_equal valid_credit_card?("4408041234567893"), true
assert_equal valid_credit_card?("440804l234567893"), false
assert_equal valid_credit_card?("38520000023237"), true # diner's club
assert_equal valid_credit_card?("4222222222222"), true # visa cards have either 13 or 16 digits
