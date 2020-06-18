# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# The class method is the one that uses 'self' in the method name. This means it refers the class, rather than 
# the instance of a class. To call this class method you would do the following:

Television.manufacturer