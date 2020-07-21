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
    
  