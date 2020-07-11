# Instance Methods
## What is an instance method?

An instance method is a method that is predefined by a class. Objects that are instatiated from that class contain these behaviours and functionality. Instance methods are therefore scoped at the level of the object. Instance methods allow objects to interact through their public interfaces. They can expose data or they can perform an operation on a prexiting state within the object. Instance methods are defined using the reserved word `def` followed by the method name. Once a method has been written, the method uses the reserved keyword `end`.

Example:
```ruby
class Bird
	def fly
	  puts "I'm flying!"
	end
end

birdy = Bird.new
birdy.fly
```
## Do instance methods have acess to instance and class variables?
Instance methods do have access instance variables and class variables even if they are not initialized within their scope. This means they can alter the state of an instance variable throughout the class.

## What is self in relation to an instance method?
Within a instance method, `self.` refers to the object calling the instance method. It is appropriate to use `self` with a instance method when we want the want to reassign an instance value that is contained within an instance method. We need to follow this protocol otherwise Ruby will interpret method invocation as initialization of new local variable and assignment with a new value. 

```ruby
class Bird
  attr_accessor :name
  def initialize(name, species)
    @name = name
    @species = species
  end
  
  def change_name=(new_name)
    self.name = new_name
  end
end

pigeon = Bird.new('Bob', 'Pigeon')
pigeon.change_name = 'John'
puts pigeon.name
```

## Why is it a good idea to call an instance method from within a class?
It is better to contain an instance method than refer directly to the instance variable as it means we can avoid needlessly duplicating the instance variable throughout our code, achieving the DRY priniciple and extracting our logic to only one place in the program. We can also use return value of the intance method for formating our outputs..

# Class Methods

## What is a class method? 
A class method is a method that can only be invoked by the class itself. It is defined within the class and has access to class variables. However, it does not have access the instance variables as class methods are only concerned with the class itself and not any instances of the class. A class method is defined using the reserved keyword `def` and `end` and the method name is prepended with `self.`. This indicates that it is a class method as `self` when used in the class body refers to the class itself. A class method can be invoked without needing to instantiate an object. 

```ruby
class Bird
	def self.what_class_is_this
		puts "This is a #{self} class"
	end
end

Bird.what_class_is_this
```

## What does `self` refer to in the context of a class method?
`self` refers to the class itself in context of a class method. Once a class method is defined, `self` refers to the class itself within the method. The only place within a class where `self` does not reference the class is within an instance method. 

## What happens when you call the .new method on a class? 

The class method .new returns an object of that class which can be assigned to a local variable. This process is called instantiation. Moreover, when `.new` is called, it automatically invokes the constructor instance method '.initialize' which allows us to initialize instance variables with values and create states within the object. 

## What is the difference between a class method and an instance method? 

A class method can only be called on the class itself. They are scoped at the class level. A class method is prepended with the reserved word `self`. A class method cannot be invoked by an instance of the class. It is not concerned with the individual states of a given object but the class as a whole. An instance method is called by the object itself. It is scoped at the object level. Instance methods are defined in the traditional way, using the reserved words `def` and `end`. They allow the programmer to expose data and modfiy data associated with the object. 