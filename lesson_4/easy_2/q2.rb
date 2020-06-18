# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# As the roadtrip class inherits from the Oracle class, it has access to the Orcacles methods. 
# When the method is invoked it will, at first, check if the method is availble within its class before
# traversing up the inheritence look up path. As the #choices method is defined in the RoadTrip class, 
# it returns this value first before moving into the superclass. Therefore, the possible options will be
# "You will visit Vegas", "You will fly to Fiji" or 'You will romp in Rome'