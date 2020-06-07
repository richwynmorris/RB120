# 1.Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end


bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name 

# 2.Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now

class Person

  attr_accessor :first_name, :last_name

  def initialize(name)
    name_parts = name.split
    @first_name = name_parts.first
    if name_parts.length > 1
      @last_name = name_parts.last 
    else
      @last_name = ''
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

# 3.Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.


class Person

  attr_accessor :first_name, :last_name

  def initialize(name)
    name_parts = name.split
    @first_name = name_parts.first
    if name_parts.length > 1
      @last_name = name_parts.last 
    else
      @last_name = ''
    end
  end

   def name
     "#{first_name} #{last_name}"
   end

  def name=(name)
    name_parts = name.split
    self.first_name = name_parts.first
    self.last_name = name_parts.last
  end

end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'



# 4. If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob.name == rob.name

# 5.Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# The code will output the class object's name and ID as the to_s method defaults to its object and id when it is used within a string. To remedy this, you can call the name method from the class object bob which will return the string. You can either then use with string interpolation or you can concatenate the string and the return value together.


# Let's add a to_s method to the class:

class Person
#   # ... rest of class omitted for brevity

  def to_s
    name
  end
end

# Now, what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# The code will output "The person's name is: Robert Smith" as the name method is invoked with the to_s method which return the string with the instance
# variables interperlated within it. Our newly created to_s method overides the default to_s method with the new return value. 




