# class GoodDog

#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     @name = n
#     @age = a 
#   end

#   def info
#     "#{self.name} is #{human_years} in human years"
#   end

#   private

#   def human_years
#     age * DOG_YEARS
#   end

# end

# fido = GoodDog.new('Fido', 4)
# p fido.age
# p fido.info



class Animal

  def a_public_method
    puts "Will this print?" + a_protected_method
  end

  def a_protected_method
    " Yes it will!"
  end

end

fido = Animal.new
fido.a_public_method
# should retirn 'Will this print? Yes it will!'
fido.a_protected_method
# Should return an error.
