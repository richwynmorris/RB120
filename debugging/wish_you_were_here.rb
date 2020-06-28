# On lines 37 and 38 of our code, we can see that grace and ada are located at the same coordinates. So why does line 39 output false? 
#Fix the code to produce the expected output.

class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end
  
  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location.to_s == grace.location.to_s 
puts ada.location == grace.location 


# The output returns false as the value is the same however, the objects are not in equivalence with one another. 
# On line _, when the the instance method `teleport_to` is invoked a new geolocation class is instantiated. 
# As both objects are not equivalent to eachother when compared the '==' method returns false. To make each object 
# equivalent to one another, you must call the to_s method to return the string value of the coordinate, and then 
# compare these two values.

# Launch School method:
# The alternative is create your own '==' method in the Geolocation class which compares whether two objects have the 
# same location using the longitude and latitude instance variables in the Geolocation class. 