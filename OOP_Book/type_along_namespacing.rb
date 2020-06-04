module Mammal

  class Dog
    def speak
      p 'arf'
    end
  end

  class Cat
    def say_name(name)
      p "#{name}!"
    end
  end

end

fido = Mammal::Dog.new
tiger = Mammal::Cat.new

fido.speak
tiger.say_name('Tiger')

