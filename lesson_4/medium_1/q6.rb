# Question 6

# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# There is no difference in the way the code works as both class variations 
# perform the same operations. However, how they access and reassign the instance
# variables differs. The first assigns the instance variable the string. However,
# the second calls the attr_acccessor method to assign the string object to the @template variable
# In the first method, on line 13, the attr_accessor method returns the value associated with the 
# template variable, as does attr_accessor method on line 27 in the second method. However, this 
# self is somewhat redundant in the code. 