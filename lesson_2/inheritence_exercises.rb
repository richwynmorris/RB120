# Suppose we're building a software system for a pet hotel business, so our classes deal with pets.
# One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. For example, bulldogs can't swim, but all other dogs can.
# 1. Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"
# 2. Create a new class called Cat, which can do everything a dog can, except swim or fetch. 
# Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.
  

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end


class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog

  def swim
    "can't swim!"
  end

end

class Cat < Pet
  def speak
    "Meow!"
  end

end




# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"
# winston = Bulldog.new
# puts winston.swim
tinker = Cat.new
puts tinker.run
puts tinker.swim

# What is the method lookup path and how is it important?
=begin
  
The method lookup path is the hierachy of objects and modules that ruby traverses through' when a method is invoked. 
Ruby will first look in the class object's directory for methods matching the one invoked, if it does not find a method
within the class object it move up to the next superclass until either the method is either found and invoked or it is not found.
  
end

