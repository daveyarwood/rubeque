# Write a queue class. A queue is a data structure where elements are added at 
# the end and removed from the front. 

class Queue
  attr_accessor :contents
  
  def initialize(arr)
    @contents = arr
  end
  
  def pop(n=1)
    if n == 1
      popped = @contents[0]
      @contents = @contents[1..-1]
    else
      popped = []
      n.times do 
        popped << @contents[0]
        @contents = @contents[1..-1]
      end
    end
    popped
  end
  
  def push(arr)
    arr.each do |x|
      @contents << x
    end
    true
  end
  
  def to_a
    @contents
  end
end

# tests
queue = Queue.new([5, 6, 7, 8])

assert_equal queue.pop, 5
assert_equal queue.pop, 6
assert_equal queue.push([4, 2]), true
assert_equal queue.pop(2), [7, 8]
assert_equal queue.to_a, [4, 2]
