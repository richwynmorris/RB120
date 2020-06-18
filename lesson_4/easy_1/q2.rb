# If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability 
# for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed 
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# Answer:
# To make the go_fast method acccessible to both classes, we need to use the include method and pass
# in the module name. This allows the class to access the methods contained within the module. 
# To check if the class have access to the this module, we can call the #ancestors method on the class
# which will return the inheritence hierarchy. If the module is accessible to that class, it will appear in the 
# in the inheritence hierarchy. 

p Truck.ancestors # => [Truck, Speed, Object, Kernel, BasicObject]