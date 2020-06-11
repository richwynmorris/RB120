# # Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name) # Name is 'Fluffy'
puts fluffy.name # 'Fluffy'
puts fluffy # 'my name is FLUFFY'
puts fluffy.name #'FLUFFY'
puts name # 'FLUFFY'

# # What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name) # Name is 'Fluffy'
puts fluffy.name # 'Fluffy'
puts fluffy # 'my name is FLUFFY'
puts fluffy.name #'FLUFFY'
puts name # 'FLUFFY'

# # Further Exploration:
# # Explain why this code produces the result it does.

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name


# The reason the accessor method name does not increase its value by 1, is because the accessor 'name' is not called on the Pet object and is instead called by the local variable 'name' which is intialized outside of the class object. The object's instance variable name remains the same as it's state has been unaltered. 
