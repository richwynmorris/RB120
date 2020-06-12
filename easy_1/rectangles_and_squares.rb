# Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

# Write a class called Square that inherits from Rectangle, and is used like this:

class Square < Rectangle
  attr_accessor :size_of_side
  
  def initialize(size)
    super(size, size)
  end

end

square = Square.new(5)
puts "area of square = #{square.area}"
