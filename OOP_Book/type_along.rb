class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} says arf!"
  end

  def self.what_am_i
    "I'm a good dog!"
  end

  def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end

end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"

puts GoodDog.what_am_i

sparky.change_info('Spartacus', '24 inches', '45 lbs')

puts sparky.name
puts sparky.speak