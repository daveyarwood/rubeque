# Rails has an awesome method, #try, which when called on a nil variable won't 
# raise an exception. Implement this method exactly as it works in Rails. 
# No using rescue.

class Object
  def try(meth, *args)
    return nil if self.nil?
    args.empty? ? self.send(meth) : self.send(meth, *args)
  end
end

# tests
a = "I love rubeque"
b = nil
c = "rubeque is like rubiks cube but with less letters"

assert_equal a.try(:length), 14
assert_equal b.try(:length), nil
assert_equal c.try(:length), 49

assert_equal a.try(:index, "rubeque"), 7
assert_equal b.try(:index, "rubeque"), nil
assert_equal c.try(:index, "rubeque"), 0


