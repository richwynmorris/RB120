# Question 5

# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Answer:
# The Pizza class has an instance variable as it is initialized using the `@` symbol in the intialize method. 
# Moreover, you can also call the .instance_variable method to find out what instance variables are initialized
# within the class. 