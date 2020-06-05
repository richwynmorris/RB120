# 1. Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't 
# specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores 
# information about the vehicle that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also has a constant 
# defined that separates it from the MyCar class in some way.

# 2. Add a class variable to your superclass that can keep track of the number of objects created that 
# inherit from the superclass. Create a method to print out the value of this class variable as well.

# 3.Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that 
# subclass.

# 4. Print to the screen your method lookup for the classes that you have created.

# 5.Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. 
# Make sure that all of your previous method calls are working when you are finished.

## 6. Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the 
# private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.

# 7.Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will 
# raise an error. Create a better_grade_than? method, that you can call like so...
# puts "Well done!" if joe.better_grade_than?(bob)



module Radioable
  def radio
    puts "Switched on Radio. Playing Radio 1."
  end
end

class Student

  attr_accessor :name, :grade

  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(student)
    grade > student.grade
  end

  protected

  def grade
    @grade
  end

end

class Vehicle

  attr_accessor :colour, :model, :current_speed, :milage
  attr_reader :year

  @@num_of_objects = 0

  def initialize
    num_of_objects += 1
  end

  def show_objects
    p @@num_of_objects
  end

  def initialize(year, colour, model)
    @year = year
    @colour = colour
    @model = model
    @current_speed = 0
    @@num_of_objects += 1
  end

  def speed_up(increase)
    p 'increasing the speed!'
    self.current_speed += increase
  end

  def brake
    p 'Braking!'
    self.current_speed -= 20
  end

  def shut_off
    p 'switching off!'
    self.current_speed = 0
  end

  def check_speed
    puts "current speed is #{self.current_speed}"
  end

  def spray_paint(new_colour)
    p 'changing the colour!'
    self.colour = new_colour
  end

  def to_s
    puts <<-info
    Heres the information we have on your current car:
    Make/Model: #{self.model}
    Colour: #{self.colour}
    Year: #{self.year}
    info
  end

  def self.calculate_miles_per_gallon(miles, gallons)
    "Your milage is: #{miles / gallons} miles per gallon"
  end

  def show_age
    puts "The car is #{calculate_age.to_s} years old."
  end

  private

  def calculate_age
    Time.now.year - self.year.to_i
  end
end


class MyCar < Vehicle
  CUSTOM_ALLOYS = true
  include Radioable
end


class MyTruck < Vehicle
  CUSTOM_ALLOYS = false
end

mazda = MyCar.new('1989', 'yellow', '5')
jeep = MyTruck.new('2005', 'red', 'explorer')
mazda.show_objects
mazda.radio
puts '-- Method Look Up --' 
puts MyCar.ancestors
jeep.show_age
mazda.show_age

joe = Student.new('Joe', 9)
bob = Student.new('Bob', 7)
puts "Well done!" if joe.better_grade_than?(bob)


# 8. Given the following code...

# bob = Person.new
# bob.hi

# And the corresponding error message...

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# What is the problem and how would you go about fixing it?


=begin 

The problem arises as the method 'hi' has been defined as a private method in the class definition. As a result, it cannot
be invoked by the object. To fix the problem, you would need to place the method defition above the private method
to allow the method to become accessible for the object.  




