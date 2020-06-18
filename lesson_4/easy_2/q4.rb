# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax

  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# You can add the built in getter and setter methods using the following syntax: attr_accessor :type. This will allow you to remove the #type and #type=() methods
# and keep the same functutionality intact. 

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end