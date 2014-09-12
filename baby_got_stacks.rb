# I like big stacks and I cannot lie
# All you other developers can't deny
# That linked lists have too much hype
# And you'd rather use a last-in-first-out datatype

class Stack
  attr_accessor :stack
  
  def initialize(stack)
    @stack = stack
  end
  
  def pop(n=1)
    if n == 1
      popped = @stack[-1]
      @stack = @stack[0..-2]
    else
      popped = []
      n.times do
        popped << @stack[-1]
        @stack = @stack[0..-2]
      end
    end
    popped
  end
  
  def push(arr)
    arr.each do |x|
      @stack << x
    end
    true
  end
  
  def to_a
    @stack
  end
end

# tests
stack = Stack.new([5, 6, 7, 8])

assert_equal stack.pop, 8
assert_equal stack.pop, 7
assert_equal stack.push([4, 2]), true
assert_equal stack.pop(3), [2, 4, 6]
assert_equal stack.to_a, [5]
