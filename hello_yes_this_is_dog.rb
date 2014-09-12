# Write a method to validate some strings that could potentially represent phone numbers. 
# See if you can do it with a regular expression.

def phone_number?(num)
  !!(/^((([^a-z\d\#\*]*[\d\#\*][^a-z\d\#\*]*){7})|(([^a-z\d\#\*]*[\d\#\*][^a-z\d\#\*]*){10}))$/ =~ num)
end

# tests
assert_equal phone_number?("5555555555"), true
assert_equal phone_number?("555555555"), false # missing a digit
assert_equal phone_number?("555-5555"), true
assert_equal phone_number?("(555) 555-5555"), true
assert_equal phone_number?("(555) 555-555"), false
assert_equal phone_number?("555-555-5555"), true
assert_equal phone_number?("555a-555-5555"), false # extraneous digit
assert_equal phone_number?("555*555-5555"), false # extraneous digit
assert_equal phone_number?("55a-555-5555"), false # extraneous digit


