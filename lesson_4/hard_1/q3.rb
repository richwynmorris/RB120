# Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull,
# but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls 
# or propellers. How would you modify the vehicles code to incorporate a new Motorboat class?

module Vehicle
  attr_reader :fuel_efficiency, :fuel_capacity
  
  def fuel_and_capacity(km, liters)    
    @fuel_efficiency = km
    @fuel_capacity = liters
  end
  
  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  
  include Vehicle
  
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    fuel_and_capacity(km_traveled_per_liter, liters_of_fuel_capacity)
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end


class Catamaran
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading
  
  include Vehicle

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    fuel_and_capacity(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class MotorBoat < Catamaran
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1,1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

boat = Catamaran.new(4,4, 70, 8.0)
car = Auto.new
puts car.range
puts boat.range
motorboat = MotorBoat.new(50,25.0)
puts motorboat.hull_count