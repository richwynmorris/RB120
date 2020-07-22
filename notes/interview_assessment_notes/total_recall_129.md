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

#### Modules have 3 purposes; to collate a collection of related classes:

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

#### To collate a collection of related behaviours. 

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



