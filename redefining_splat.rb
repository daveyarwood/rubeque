# Can you redefine the splat/unary/asterisk operator? 

class String
  def to_a
    [self.swapcase]
  end

  alias to_ary to_a
end

# tests
assert_equal "FOO", *"foo"
*x = "BAR"
assert_equal ["bar"], x
