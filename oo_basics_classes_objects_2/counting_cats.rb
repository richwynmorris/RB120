# Counting Cats

# Using the following code, create a class named Cat that tracks the number of times a new Cat object is instantiated. The total number of Cat instances should be printed when ::total is invoked.

class Cat
  @@total = 0
  
  def self.total
    puts @@total
  end
  
  def initialize
    @@total += 1
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

# Expected output:

# 2