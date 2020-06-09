
# Guaranteed Formatting

# Using the following code, add the appropriate accessor methods so that @name is capitalized upon assignment.

class Person
  def name=(name)
    @name = name.downcase.capitalize
  end

  def name
    @name
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

# Expected output:

# Elizabeth

