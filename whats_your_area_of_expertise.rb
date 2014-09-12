#  Defining collaborating objects can be useful to solve problems. 
# For example a rectangle object might use point objects to represent its corners. 
# Your task is to define a method to calculate the area of a Rectangle from its two corners.

class Point
  attr_accessor :x, :y
  def initialize(x, y)
    self.x, self.y = x, y
  end
end

class Rectangle
  attr_accessor :upper_left, :lower_right
  
  def initialize(upper_left, lower_right)
    self.upper_left, self.lower_right = upper_left, lower_right
  end
  
  def area
    height = (upper_left.y - lower_right.y).abs
    width = (lower_right.x - upper_left.x).abs
    height * width
  end
end

# tests
p1 = Point.new(0, 0)
p2 = Point.new(3, 4)
assert_equal Rectangle.new(p1, p2).area, 12
assert_equal Rectangle.new(p2, p1).area, 12
assert_equal Rectangle.new(Point.new(13, 5), p2).area,  10


