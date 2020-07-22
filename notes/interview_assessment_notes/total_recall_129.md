## Encapsulation

Encapsualtion is the process of creating clearly defined objects between objects that interact only through their public interface.

Encapsulation is a way of hiding data and functionality from the existing code base so that operations can be performed within the scope of the object.

Encapsulation can be achieved through instantiation, accessor methods and access modifiers (public, private and protected).

When objects are instantiated they have their own scope which is defined at the object level. 

```ruby
class Animal
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

rabbit = Animal.new('Rabbit')
fox = Animal.new('Fox')

p fox.name # => 'Fox'
p rabbit.name # => 'Rabbt'
```


## Polymorphism

Polymorphism is defined as interacting with something that has many different forms. In terms of programming, this refers to the ability to interact with different data contained within an object using a common interface. 

In object orientated programming polymorphism can be achieved in two ways. Both through inheritence polymorphsim and interface polymorphsim. 

Inheritence polymorphism refers to ability for a subclass to inherit behaviours and data from a single superclass. With inheritence, subclasses can overide instance methods contained in their parent classes thereby achieving polymorphism. 

```ruby
class Animal
	def speak
  	puts " I'm speaking"
  end
  
  def run
  	puts "I'm running!"
  end
end

class Dog < Animal
	def speak
  	puts "woof!"
  end
end

hudson = Dog.new

hudson.run # => "I'm running!"
hudson.speak # => "woof!"
```

```ruby
module Swimmable
 def swim
 	 puts "I'm swimming!"	
 end
end


class Animal ; end
class Mammal < Animal 
end
class Dog < Mammal
  include Swimmable
end
```

```ruby
class MeetTheDucks
  def introduction(ducks)
    ducks.each do |duck|
      duck.quack
    end
  end
end


class BilliamDrakespeare
  def quack
    puts "To quack or not to quack? That is the question."
  end
end

class JamesPond
  def quack
    puts "The name's quack. Quack, quack."
  end
end

class Chewquacker
  def quack
    puts "Quuuuuaaaccckkkkkkrrrr"
  end
end

meet_the_ducks = MeetTheDucks.new

meet_the_ducks.introduction([BilliamDrakespeare.new, JamesPond.new, Chewquacker.new])
```

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

class Adult < Person
  def initialize(name, job)
    super(name)
    @job = job
  end
end
```

## Inheritence

Inheritence is the ability for larger and more general, superclassses to extend their functionality into subclasses, which are derived from the superclasses, and produce more highly defined and granular subclasses with specific behaviours and attributes. This means we're able to order our code in a hierarchial structure. However, this also means that classes can only inherit from one single superclass. we usually use class inhertience when we're refering to an `i-a` relationship between two classes. 

## Class Inheritence

```ruby
class A
  def what_am_i
    puts self.class
  end
end

class B < A
end 


example = B.new
example.what_am_i
```

## Interface Inheritence

```ruby
module C
  def what_am_i
    puts self.class
  end
end
  

class A
  def what_am_i
    puts self.class
  end
end

class B < A
  include C
end 


example = B.new
example.what_am_i

B.ancestors
```
    
## Modules

Modules allow us to achieve multiple inheritence in OOP. As class inheritence only allows subclasses to inherit from one superlass, Modules allow us to 'mixin'  a collection of behvaiours through interface inheritence. Thereby allowing a class to both inherit from a superclass and from a module.

#### Modules have 3 purposes; to collate a collection of related classes (namespacing):

```ruby
module Animal
  class Dog ; end
  class Cat ; end
  class Rabbit ; end
end
```

We can instantiate an object from a class using the namespare resolution operator:

```ruby
rabbit = Animal::Rabbit.new
rabbit.class # => Animal::Rabbit
```

Collating a collection of classes allows the programmer to order their code and prevent class collisions with a program

```ruby
module City
  class Cat ; end
end

module Jungle
  class Cat ; end
end


whiskers = City::Cat.new
panther = Jungle::Cat.new
```

#### To collate a collection of related behaviours (namespacing). 

```ruby
module Actionable
  def swim ; end
  def run
    puts "Running!"
  end
  def jump ; end
end

class Person
  include Actionable
end

joe = Person.new
joe.run
```

#### To store a utility method that we may want to make available to exisiting code base

```ruby
module Add
  def self.two(num)
    num + 2
  end
end

result = Add::two(8)
p result # => 10
```

Modules allows us to achieve polymorphism in our code as we're able to provide a common interface for behvaiours that we can mixin to our classes. You can mix in as many modules as you want to within a class.

Modules cannot be instantiated, therefore they may not be the appropriate object to use when trying to store data and behvaiours, class inheritence would be the appropriate course of action. We primarily use modules when a 'has-a' relationship exists between a class and behaviour.

Modules cannot inherit from one another but they can include their interfaces with one another

#### Example:

```ruby
module Swimmable
  def swim
    puts "I'm swimming"
  end
end

module Runnable
  include Swimmable

  def run
    puts "I'm running!"
  end
end

class Person
  include Runnable
end

joe = Person.new.swim
```

## Namespacing

Namespacing is a way of grouping together common behvaiours or related classes using modules.

To indicate to Ruby where it should begin its search, we use the namespace resolution operator `::`

#### Namespacing in relation to constants.

As constant are scoped at the lexical level, meaning they scoped at the level they are defined at, we need to indicate to Ruby where it should look when trying to find the constant by using the the namespeace resolution operator to reference the specific location:

#### Example:

```ruby
module Colour
  COLOUR = 'red'
end

class Person

  def display_favourite_colour
    puts "My favourite colour is #{Colour::COLOUR}"
  end
end

joe = Person.new
joe.display_favourite_colour # => "My favourite colour is red"
```

Ruby's standard library uses namspacing heavily to make common methods and constants accessible:

```ruby
p Math::PI # => 3.141592653589793
``` 

## Objects

It's often stated in Ruby that everything is an object and this is true in the most part. 

Objects, within the context of OOP, refers to a building block which has two major features; behaviours and states.

Objects can perform operations, within the scope of themselves, using their defined behaviours. These behaviours are another way of phrasing the methods or functions that are available to object. These are predefined by the class which acts as a blueprint for objects which are instantiated from it. 

Objects are also able to contain data which is stored as a 'state' within the object. States are our way of tracking an object as it's data is exposed and modified.

To create an object, we follow the process of `instantiation`:

```ruby
class Person ; end
end

joe = Person.new # => instantiation has taken place.
```

The instantiation of an object is another way that we can achieve the encapsulation design principle as objects can only interact through their public interfaces.

Objects once instantiated create their own scope and as a result, only instance methods can be invoked on them as objects are concerned primarily with the individual object not the class as a whole.


## Classes

Classes can be thought of as a blueprint for objects that are instantiated from them. They define both the behaviours and attributes an object will inherit once it is instantiated.

Classes can inherit from one another and extend their functionality through the use of class inheritence. 

Classes use an 'is-a' relationship when inheriting from one another.

Classes can only be interacted within using class methods.

#### Creating a class

```ruby
class MyClass
end
```

## Instance Variables

Instance variables are scoped at the object level and are prepended with an `@`. 

Instance variables are are not limited my metho definitions and are accessible across instance methods contained within the object.

Instance variables allow us to track the `state` of the object by tracking the data associated within the object.

Instance variables are not accessible to class methods, as class methods are only concerned with the class itself and not the individual instance of the class. 

```ruby
class Person
  def initialize(name)
    @name = name
  end
  
  def self.display_name
    @name
  end
end

joe = Person.new('Joe')
p Person.display_name # => nil
```

Individual objects whilst they might share behaviours, they do not share states. Therefore, instances variables defined in one object, will not be available in another.

```ruby
class Person
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end


person1 = Person.new('Joe')
person2 = Person.new('Richard')

p person1.name # => Joe
p person2.name # => Richard
```

Instance variables are available down the hierarchy but they must first be initialized before they can be referenced.

```ruby
class Person
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

class Adult < Person
end

person1 = Adult.new('Joe')

p person1.name
``` 

When an instance variable is uninitialized it returns nil.

```ruby
class Person
  attr_reader :name
  
  def initialize
    @name
  end
end

class Adult < Person
end

person1 = Adult.new
p person1.name # => nil
```

Instance variables exist only so long as the object exists. 

## Instance Methods

Instance methods are methods that are scoped at the object level and they are predefined in the class that the object is instantiated from. 

Instance methods are defined using the reserved word `def` and ending with `end`. 

Instance methods have access to instance variables that initialized within the object depsite it not being defined in its own scope. 

Instance methods allow us to expose and modify data through the public interface of the object or allow us to perform operations within the context of the object whilst being hidden from the existing code base.

Instance methods are only concerned with the individual isntance of the class and the not the class as a whole. Therefore, you cannot call an instance method on the class itself.

```ruby
class Person
  attr_reader :name
  
  def initialize
    @name
  end
  
  def run
    "I'm running!"
  end
end

class Adult < Person
end

person1 = Adult.new
p Adult.run # => NoMethodError
```

## Clas Variables

Class variables are way of tracking data concerned with the class itself. Class variables signposted with a prepended `@@`symbol and exist so long as the class exists. 

class variables do not need to be defined within a class method and can instead be defined in the body of the class itself.

class variables are scoped at the class level and available both to instances of the class and the class itself.

A class and all derived instances of the class share one copy of the class variable. This means that is the class variable is modified by any instance of the class or the class itself, the value will be altered throughout all instances of the class. For this reason, many rubyists avoid using class variables. 

#### Example of class variables being used: 

```ruby
class CarManufactorer
  @@total_cars = 0

  def self.produce_astra
    Car.new('Astra')
    @@total_cars += 1
  end

  def self.display_total_cars
    @@total_cars
  end
end

class Car
  def initialize(model)
    @model = model
  end
end

2.times do 
  CarManufactorer.produce_astra # @@total_cars is incremented by 1  X 2 
end

p CarManufactorer.display_total_cars # => 2
```


#### Example of class variables being modified by an instance of the class:

```ruby
class CarManufactorer
  @@total_cars = 0

  def self.produce_astra
    Car.new('Astra')
    @@total_cars += 1
  end

  def self.display_total_cars
    @@total_cars
  end

  def change_total_cars=(num)
    @@total_cars = num
  end
end

class Car
  def initialize(model)
    @model = model
  end
end

2.times do 
  CarManufactorer.produce_astra # @@total_cars is incremented by 1  X 2 
end

vauxhall = CarManufactorer.new
vauxhall.change_total_cars  = 4 # instance of the class reassigns the value of @@total cars to 4

p CarManufactorer.display_total_cars # => 4 - The @@total_cars variable is changed in the class itself. 
```









