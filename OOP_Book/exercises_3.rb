# Task 1
# Add a class method to your MyCar class that calculates the gas mileage of any car.
# Task 2
# Override the to_s method to create a user friendly print out of your object.

class MyCar

  attr_accessor :colour, :model, :current_speed, :milage
  attr_reader :year

  def initialize(year, colour, model)
    @year = year
    @colour = colour
    @model = model
    @current_speed = 0
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

  def self.calculate_miles_per_gallon(miles, gallons)
    "Your milage is: #{miles / gallons} miles per gallon"
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


mazda = MyCar.new(2014, 'Midnight Blue', 'Mazda 3')
MyCar.calculate_miles_per_gallon(26, 4)
puts mazda


# Task 3:
#When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

#We get the following error...

#  test.rb:9:in `<main>': undefined method `name=' for
#    #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

# # Why do we get this error and how do we fix it?

# # We get an error as, on line 74, the .name instance variable is called and asked to reassign the 
# # current value, which is the string object 'Steve', with the string object 'Bob'. However, 
# # on line 67 the accessor is set as a reader method or a 'getter' method which means the instance variable 
# # cannot be reassigned with a new object. To fix this issue, you would need to chage the accessor method to
# # attr_accessor. This would allow you to both read and write for the instance variable.  