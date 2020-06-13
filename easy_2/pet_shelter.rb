# Consider the following code:

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

end

class Owner
  attr_accessor :pets, :name
  
  def initialize(name)
    @name = name
    @pets = []
  end
  
  def number_of_pets
    @pets.count
  end
    
end

class Shelter
  attr_accessor :new_owner, :owners
  
  def initialize
    @owners = {}
  end
  
  def adopt(new_owner, pet)
    @new_owner = new_owner
    new_owner.pets << "a #{pet.type} named #{pet.name}"
    @owners[new_owner.name] = new_owner
    
  end

   def print_adoptions
     @owners.each do |name, object|
       puts "#{object.name} has adopted the following pets:"
       puts object.pets
     end
   end

end



butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# Write the classes and methods that will be necessary to make this code run, and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# The order of the output does not matter, so long as all of the information is presented.