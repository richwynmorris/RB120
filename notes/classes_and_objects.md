# Classes 

What are classes? 
Classes are the blueprints for creating objects in Ruby. Classes shape the object by defining its `behaviours` and `attributes`. When objects are created from a class we call this process `instantiation`. Classes are named using the CamelCase convention. 

```ruby
class MyClass
end
```
classes have the ability to inherit from one another. A class that inherits from another is called a `subclass`. The 'parent' of the subclass is what we call the `superclass`. This process is called `inheritence`. When a subclass inherits  from a superclass, it has access to the methods and states that are defined and initialized in the superclass. This allows us to achieve the concept of polymorphism. 

```ruby
class Bird
  def initialized(name)
  	@name = name 
  	@fly = true
  end

  def squawk
  	puts 'squawk'
  end

end

class Chicken < Bird
  def initialize(name)
    @name = name 
  end
end

bob = Chicken.new
bob.squawk
```

What is an object?
An object is one of the bulding blocks of object orientated programming. Objects consist of data and behaviours that are predefined
by the class that it is instatiated from. 

```ruby
my_object = MyClass.new
```
To instantiate an object we first initialize a local variable and assign it to the class we wish to create an instance of. We then invoke the .new class method on this class. When the .new method is invoked, it automatically invokes the instance method initialize, which is a constructor method. After this operation has taken place, ``my_object` is now considered an instance(or object) of the class `MyClass` and defined with the behaviours and attributes of that class. 