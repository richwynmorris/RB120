# Consider the following class:

class Machine
 
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end
  
  def display_switch
    puts "The current state of the switch is #{switch}."
  end
  
  private
  
  attr_accessor :switch
  
  def flip_switch(desired_state)
    self.switch = desired_state
  end
  
end

# Modify this class so both flip_switch and the setter method switch= are private methods.

light = Machine.new
light.start
light.display_switch