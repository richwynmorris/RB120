# Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables 
# that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to 
# track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar

  attr_accessor :year, :colour, :model, :current_speed

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

end

vauxhall = MyCar.new(2016, 'blue', 'vxr')
vauxhall.current_speed = 40
vauxhall.check_speed
vauxhall.brake
vauxhall.check_speed
vauxhall.speed_up(30)
vauxhall.check_speed
vauxhall.shut_off
vauxhall.check_speed
