# Consider the following class definition:

class Flight

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end

end

# There is nothing technically incorrect about this class, but the definition may 
# lead to problems in the future. How can this class be fixed to be resistant to 
# future problems?

# As the @database_handle has no argument passed to when the object is instantiated,
# it would suggest that the instance variable and its value doesn't need to be altered.
# By having the accessor method present it allows easy access to the variable which may
# cause issues if the instance variable needs to be solely assigned the Database object.  