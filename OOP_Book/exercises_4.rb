# 1. Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't 
# specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores 
# information about the vehicle that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also has a constant 
# defined that separates it from the MyCar class in some way.


# 2. Add a class variable to your superclass that can keep track of the number of objects created that 
# inherit from the superclass. Create a method to print out the value of this class variable as well.


class Vehicle

  @@num_of_objects = 0

  def show_objects
    p @@num_of_objects
  end
    

  def self.calculate_miles_per_gallon(miles, gallons)
    "Your milage is: #{miles / gallons} miles per gallon"
  end

end


class MyCar < Vehicle

  CUSTOM_ALLOYS = true

  attr_accessor :colour, :model, :current_speed, :milage
  attr_reader :year

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

end


class MyTruck < Vehicle
  CUSTOM_ALLOYS = false

  attr_accessor :colour, :model, :current_speed, :milage
  attr_reader :year

  def initialize(year, colour, model)
    @year = year
    @colour = colour
    @model = model
    @current_speed = 0
    @@num_of_objects += 1
  end

end

mazda = MyCar.new('1989', 'yellow', '5')
jeep = MyTruck.new('2005', 'red', 'explorer')
mazda.show_objects
