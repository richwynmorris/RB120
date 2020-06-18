# In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

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

# When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed
# when we go fast includes the name of the type of vehicle we are using. How is this done?

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!

# Answer:
# When the method #go_fast method is invoked it outputs a string object. The string uses string interpolation principles and embeds the return 
# result of the object, which is `self` with the #class method invoked on it. This returns the object class, either Car or Truck, and interpolates it within the string.
