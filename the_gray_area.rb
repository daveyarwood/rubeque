#  Write code that will make true equal false in the following problem. 

class TrueClass
  def == something
    (something == false) ? true : false
  end
end

# tests
assert_equal true, false
