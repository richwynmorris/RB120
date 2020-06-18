# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# The class variable @@cats_count is indentifiable by its prefix @@. This means the variable is accessiable to all instances
# of that particular class. Upon a `Cat` object being instantiated, The initialize method is invoked. When it is invoked, the 
# class variable `@@cat_count' is reassiged with an additional 1. 

# To test the theory and the result you would need to call the following method. 

ginger = Cat.new('cat') # => @@cats_count += 1
shadow = Cat.new('cat') # => @@cats_count += 1
puts Cat.cats_count # => 2