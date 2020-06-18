# Question 5

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer #=> Undefined method 
tv.model #=> returns the value of the method instance method invocation.

Television.manufacturer #=> returns the value of the class method invocation
Television.model #=> undefined method