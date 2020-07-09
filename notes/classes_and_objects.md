# Classes 

## What are classes? 
Classes are the blueprints for creating objects in Ruby. Classes shape the object by defining its `behaviours` and `attributes`. When objects are created from a class we call this process `instantiation`. Classes are named using the CamelCase convention. 

```ruby
class MyClass
end
```
classes have the ability to inherit from one another. A class that inherits from another is called a `subclass`. The 'parent' of the subclass is what we call the `superclass`. This process is called `inheritence`. When a subclass inherits  from a superclass, it has access to the methods and states that are defined and initialized in the superclass. This allows us to achieve the concept of polymorphism. 

```ruby
class Bird
  def initialize(name)
    @name = name 
    @fly = true
  end

  def squawk
    puts 'squawking!'
  end

end

class Chicken < Bird
end

bob = Chicken.new('Bob')
bob.squawk
```

## What is an object?
An object is one of the bulding blocks of object orientated programming. Objects consist of data and behaviours that are predefined
by the class that it is instatiated from. 

```ruby
my_object = MyClass.new
```
To instantiate an object we first initialize a local variable and assign it to the class we wish to create an instance of. We then invoke the #.new class method on this class. When the .new method is invoked, it automatically invokes the instance method #initialize which is a constructor method. The class method `#new` then returns a new object from that class. After this operation has taken place, my_object is now referencing an instance (or object) of the class, in the case above it would be an instance of MyClass, and defined is with the behaviours and attributes of that class.

Objects share behaviours but they do not share states. 

## What is a constructor method?

A constructor method is a method that is automatically called everytime an instance of a class is instantiated. In the case of object orientated programming, a constructor method would be `#initialize`. The initialize method allows for an instance to a class to be created and but does not return anything.

## What is a instance variable?

An instance variable is a variable that is contained within an object. Instance variables allow us to track and modify the `state` of an object. Instance variables are defined with a prepended `@` symbol. Moreover, instance variables can be 
accessed at the scope of the object and therefore are available to instance methods that are defined within the specfic object itself. Instance variabes are not accessiable between objects and this helps achieve the concept of encapsualtion. Instance variables only exist so long as the object exists.

## What does 'state' mean in the context of an object?
'state' refers to the instance variables within the object and the values that they are tracking in their totality. This means an object has a particular state dependent on what its attributes are assigned to.  

## What is a class variable?
A class variable is a variable is scoped at the class level. A class variable is defined with `@@` and is available to both instance methods and class methods contained within the class. class variables are unique in the sense that all objects instantiated from that class share 1 copy of the class variable. This means that all objects instantiated from a class have the ability to modify the class variable. For this reason, class variables are considered to be a unpredictable method of tracking data as they go against the concept of encapsulation. Class methods can access class variables regardless of where it is initialized. 

```ruby
class MyClass
  @@total_times_initialized = 0

  def initialize
    @@total_times_initialized += 1
  end

  def self.total_times_initialized
    puts @@total_times_initialized
  end
end

example = MyClass.new
MyClass.total_times_initialized # => 1
```

## What is a constant?
A constant is a variable which refences a value that should not change or be modified. A constant has a lexical scope which means it can be accessed by both the class methods and instance methods contained within the object. A constant is defined all capital letters like in the following syntax:

```ruby
CONSTANT = ['string', 4, 3.2]
```

## What does behaviour mean in terms of an object?
A behvaiour is a operation that a object can perform. These are defined as either class methods, instance methods or methods that inherited by either a module or a superclass. 

## What does a setter method do? 
A setter method is a custom method within an object that allows a instance variable to be reassigned with a new value. It allows us to change the 'state' of an object. To define one you need to use the following syntax:

```ruby
class Bird
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end
end

bob = Bird.new('Bob')
bob.name = 'Barry'
puts bob.name # => Barry
```

Ruby uses clever syntatical sugar which we need to be aware of when defining our own custom methods. For example, when calling the custom getter method we can see the following syntax being used:

```ruby
def name=(name)
```
The syntax of `name=(arg)` is replaced with the syntatical sugar `name = arg` for readability purposes.  

## What does a getter method do?
A getter method is a method within an object that returns the value assigned to an instance variable within the object, or the 'state' of an object. Getter methods allow us to expose data contained within the object and allows objects to interact through their public interfaces.

We can define a custom getter method using the following syntax:

```ruby
class Bird
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

bob = Bird.new('Bob')
bob.name # => 'Bob'
```













