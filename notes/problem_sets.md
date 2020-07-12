
## Classes and objects, Encapsulation,  working with collaborator objects, public/private/protected methods


### 1) If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    self.name == other.name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob == rob # => true

```

### 2) Create an empty class named Cat.

```ruby
class Cat
end
```

### 3) Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.
```ruby
class Cat
end

kitty = Cat.new
```

### 4) Identify all custom defined objects that act as collaborator objects within the code. 

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)
```
### Answer:
The custom defined object that acts as collaborator objects in the above code is `sara`. The `sara` object is passed in as an argument to the class method `#new`, which is then passed to the `#initialize` method. The custom object `sara` then assigned to the instance variable `owner` within the `fluffy` object. As a result, the custom object `sara` exists as a state within the `fluffy` object and both these objects now have a relationship of association with one another. 


## 5) What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

```ruby
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name) #=> fluffy object instantiated. 
puts fluffy.name # => 'Fluffy'
puts fluffy # => My name is 'FLUFFY.'
puts fluffy.name # => 'FLUFFY'
puts name # => 'FLUFFY'
```
To fix this, on line 77, you would want to call the attr_reader method `name`, rather than the instance variable `@name` as this is being permantently mutated by the `#upcase!` method on line 76. As the local variable `name` and the instance variable `name` both reference the same value, once it is mutated, both variables point to the same mutated value.

```ruby
  def to_s
    "My name is #{name.upcase}."
  end
  ```

### 6) What would happen in this case?

```ruby
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @new_name = @name.upcase
    "My name is #{@new_name}."
  end
end

name = 42
fluffy = Pet.new(name) # @name => '42'
name += 1 # => name => 43
puts fluffy.name # => '42'
puts fluffy # => My name is 42
puts fluffy.name # => 42
puts name # => 43
```

### Answer:
The reason that `name` isn't mutated within the object is a result of being reassigned with `+= 1`. The local variable `name` now points to a new value when it reassigned a new `Integer` object. This then points to a new object in the memory. However, the original object that is passed in to the `initialize` method still continues to point to the `Integer` `42` although it is converted to a `String` object within the scope of the `fluffy` object.   


## Polymorphism, inheritance, modules, method lookup path, duck-typing

### 7) What will the following code output?

```ruby
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak # => # "Daisy says moooooooooooo!"

```

## Answer:
The reason this outputs "Daisy says moooooooooooo!" is because the `#speak` method is invoked from the `Cow` class. Speak s first called from the `Animal` superclass as it does not exist in the subclass. This calls the `#sound` method. As the original calling object was from the `Cow` class, ruby checks this first for a `#sound` method. As this exists, it is executed. Within the `sound` class, the `super` method is invoked with calls the method of the same name, which is higher in the ineritence hierarchy. This prints "Daisy says " whilst being concatanated with the `String` object `"moooooooooooo!"` from the `Cow` subclass. 


class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Chef
        preparer.prepare_food(guests)
      when Decorator
        preparer.decorate_place(flowers)
      when Musician
        preparer.prepare_performance(songs)
      end
    end
  end
end

class Chef
  def prepare_food(guests)
    # implementation
  end
end

class Decorator
  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_performance(songs)
    #implementation
  end
end

# 8) The above code would work, but it is problematic. What is wrong with this code, and how can you fix it?

The above code is problematic as we're relying on the `prepare` method to execute each of the responsibilities of each class using the dependencies within the method, rather than allowing the execution of the behaviours to take place within the object. This means if the we want to add another class to the `preparers` we would need to go in an alter the `prepare` method again. We can solve this problem through ducktyping. 

```ruby
class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare(self)
    end
  end
end

class Chef 
  def prepare(wedding)
    prepare_food
  end

  def prepare_food(wedding.guests)
    # implementation
  end
end

class Decorator 
  def prepare(wedding)
    decorate_place
  end


  def decorate_place(wedding.flowers)
    # implementation
  end
end

class Musician 
  def prepare(wedding)
    prepare_performance
  end


  def prepare_performance(weddding.songs)
    #implementation
  end
end

wedding = Wedding.new
wedding.prepare([Chef.new, Decorator.new, Musician.new])

```
### 9) What change(s) do you need to make to the below code in order to get the expected output?

```ruby
class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end

  def speak
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
sir_gallant.name # => "Sir Gallant"
sir_gallant.speak # => "Sir Gallant is speaking."
```
### 10) Make the changes necessary in order for this code to return the expected values.

```ruby
class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

p Sheep.new.speak # => "Sheep says baa!"
p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
p Cow.new.speak # => "Cow says mooooooo!"
```
## 11) # What is the return value below , and why?

```ruby
class Person
  def get_name
    @name                     # the @name instance variable is not initialized anywhere
  end
end

bob = Person.new
bob.get_name                  # => ??
```
### Answer: 
The return value will be `nil` as an unitialized instance variable always returns `nil` 


### 12) How do you get this code to return “swimming”? What does this demonstrate about instance variables?

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    enable_swimming
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim                                  
```

### Answer:
You must first invoke the `#enable_swimming` method and initialize the instance variable with a value before you can reference it. Any uninitialized instance variable returns `nil` and, as a result, the conditional `if` statement is never executed as `nil` is a falsy. 

### 13) What would the above code return, and why?

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels                              # => 4

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels                           # => 2
Vehicle.wheels                              # => 2

class Car < Vehicle
end

Car.wheels                                  # => 2
```

### Answer:
class variables are shared as one copy between all subclasses inherited from the class, objects instantiated from the class and the class itself. As a result, if the class variable is modified or reassigned with a new value, all classes and objects which share that class variable are also modified, as they all point to the same value. 

### 14) Describe the error and provide two different ways to fix it.

```ruby
module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires 
```
### Answer:
The error occurs as constants are defined at their lexical scope. Which means that Ruby first checks the level the constant is defined at first before checking the inheritence hierarchy. As the `maintenance` module does not contain the constant and it is not accessible in the hierarchy, Ruby is unable to reference the constant's value. 

To fix this, you need to use a namespace resolution operator and reference the constant are either:
- "Changing #{Vehicle:WHEELS} tires."
- "Changing #{Car::WHEELS} tires."

### 15) Using the following code, allow `Truck` to accept a second argument upon instantiation. Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
```

### 16)Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.

```ruby
class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

# Expected output:

# Ready to go! Drive fast, please!
```
### 17) Write a class called Square that inherits from Rectangle, and is used like this:

```ruby
class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(size)
    super(size, size)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"
```

### 18) When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

```ruby
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end
```
### Answer:
`self` used in the context of the module refer to the object itself. Calling the method `#class` method on this returns the type of vehicle it is. This is then interpolated within the string. 

### 19) What will this return, and why?

```ruby
module Drivable
  def self.drive
    "is this possible"
  end
end

class Car
  include Drivable
end

p Car.drive
```
### Answer: 
This is not possible as the class method is not defined within the class itself. As a result, when it is called on a class object, the class cannot find the method within it's scope and a `NoMethodError` is returned.


## Use attr_* to create setter and getter methods, How to call setters and getters, Referencing and setting instance variables vs. using getters and setters


### 20) Why does the .change_info method not work as expected here?
```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      
# => Sparky weighs 10 lbs and is 12 inches tall.
```
### Answer:
`#change_info` does not work here as ruby is interpretating the variables within the method as initialization of new local variables instead of reassignment. To fix this you need to prepend the accessor method calls with `self.` to reassign the new values to the prexisting instance variables.

```ruby
  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
```

### 21) What code snippet can replace the "omitted code" comment to produce the indicated result? 

```ruby
class Person
  attr_accessor :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end
end

mike = Person.new
mike.first_name = 'Michael'
mike.last_name = 'Garcia'
p mike.full_name # => 'Michael Garcia'
```
### 22) The last line in the above code should return "A". Which method(s) can we add to the Student class so the code works as expected?

```ruby
class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    @grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
priya.grade # => "A"
```
### 23) In the example below, why would the following not work?

```ruby
def change_grade(new_grade)
  grade = new_grade
end
```
### Answer:
The above will not work as within the method definition, ruby interprets `grade` as initialization of a new instance variable. However, the intention here is to call the instance method `name`. We need to explicit in inidicating to Ruby what `grade` references. To do this, we need to prepend `grade` with `self.` In this context, Ruby interprets `self` as the object itself calling the method and thus the method is called and the instance variable reassigned with the new value. 

### 24) Given the below usage of the `Person` class, code the class definition.
```ruby
class Person
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
```

### 25) Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now:
```ruby
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(name)
    @first_name = name.split.first
    @last_name = name.split.length.eql?(1) ? '' : name.split.first
  end
  
  def name
    "#{first_name} #{last_name}"
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
```



## To Finish!
------------
Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'
Link #3
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       # => ??
# What will this return, and why?
Link
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def rename(new_name)
    name = new_name
  end
end

kitty = Cat.new('Sophie')
p kitty.name # "Sophie"
kitty.rename('Chloe')
p kitty.name # "Chloe"
# What is wrong with the code above? Why? What principle about getter/setter methods does this demonstrate?
Link
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
You can see in the make_one_year_older method we have used self. What does self refer to here?


Link #8



Instance methods vs. class methods, self, Calling methods with self, More about self, to_s, overriding to_s

On which lines in the following code does self refer to the instance of the MeMyselfAndI class referenced by i rather than the class itself? Select all that apply.


class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new
Link #19
Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
Link #5a
Let's add a to_s method to the class:

class Person
  # ... rest of class omitted for brevity

  def to_s
    name
  end
end
Now, what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
Link #5b
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end
end

ade = Student.new('Adewale')
ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
# Why does this code not have the expected return value?
Link #2, D





Fake operators and equality

arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id      # => ??

sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id      # => ??

int1 = 5
int2 = 5
int1.object_id == int2.object_id      # => ??
# What will the code above return and why?
Link
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
End

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)
puts "bob is older than kim" if bob > kim
# How can you make this code function? How is this possible?
Link
my_hash = {a: 1, b: 2, c: 3}
my_hash << {d: 4}  
# What happens here, and why?
Link
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    members + other_team.members
  end
end

# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)

niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
dream_team = cowboys + niners               # what is dream_team?
# What does the Team#+ method currently return? What is the problem with this? How could you fix this problem?
Link
