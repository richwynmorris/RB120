
## What is the OOP? What does it allow programmers to achieve? 
Object orientated programming is the concept of having access to containers, or objects, which can store data and behaviours that are not accessible to the rest of the code base. In essense, it is a way of hiding functionality and protecting data. Object orientated programming allows developers to build programs with greater layers of functionality and complexity. Object orientated programming has three key design principles which are: polymorphism, encapuslation and inheritence.

## What is an object and can you give an example? 
A object is one of the building blocks of OOP. Objects interact through their public interfaces within the code base and have defined boundaries between one another. Objects gain their behvaiours and attributes by being instantiated from a class. This class provides the outlines, or blueprint, for the object. You can instantiate as many objects from a class as you want, however, these objects do not share data or behaviours with another.

```ruby
class Car
  attr_reader :wheels
  
  def initialize
    @wheels = 4
  end
end

corsa = Car.new # `corsa` is a local variable pointing to an object instantiated from the `Car` class. We can consider corsa the object.
corsa.wheels # => 4 
```

## What is a class and can you give an example?
A class is the blueprint for objects which are instantiated from it. It defines the behaviours and attributes within an object. Classes can inherit from one another and can be ordered in a single inheritence sequence. The parent is called the `superclass` and the child is called the `subclass`.

```ruby
class Car
  attr_reader :wheels
  
  def initialize
    @wheels = 4
  end
end

corsa = Car.new # `corsa` is instantiated from the `Car` class when the `new` method is invoked
corsa.wheels # => 4
```

## What is a module? Can you provide an example?
A module is a way to achieve polymorphism in our code. Modules are a collection of methods or behaviours which are available for us to use via mixins. A module can be 'mixed in' using the `include` method. You can include as many mixins as you want. Modules allow us to include behaviours when the traditional single inheritence system does not provide appropriate class to contain a collection of behvaiours.

```ruby
module Driveable
  def drive
    puts "I'm driving!"
  end
end

class Car
  attr_reader :wheels

  include Driveable
  
  def initialize
    @wheels = 4
  end
end

corsa = Car.new
corsa.drive
```

## What are the 3 reasons for using a module?
* A module can be used to `mixin` behaviours into a class when it cannot inheritence the behaviour from single inheritence.

(see example above)

* A module can be used to collate related classes and behaviours together. This is called `namespacing`. `Namespacing` is useful as it allows us to group together related classes, and prevent collisions between classes in the program. 

```ruby
module Pets
  class Dog ; end
  class Cat ; end
  class Hamster ; end
end

fido = Pets::Dog.new
p fido.class # => Pets::Dog
```

### Example of working around class collision:

```ruby
module Town
  class Animal ; end
end

module Forest
  class Animal ; end
end

town_fox = Town::Animal.new
forest_fox = Forest::Animal.new

p town_fox.class # => Town::Animal
p forest_fox.class # => Forest::Animal
```

* Finally, modules have the ability to act as containers for behaviours and methods. we're able to call a method directly from the module. It is important to remember that you need to call `self` on a module method to indicate to ruby that this is a `module method` being called on the module itself.

```ruby
module Multiplyable
  def self.by_2(value)
    value * 2
  end
end

result = Multiplyable::by_2(4)
p result
```

## What is the inheritence model that modules use? 

Modules use **Interface Inheritence** which is the ability to inherit the interface of the module and use it's defined behaviours as opposed to inheriting directly from a single superclass. A class can mixin as many modules as it wants.

Modules work on horizontal interface inheritence basis and as such modules can be included within one another using the `include` method. 

```ruby
module Speakable
  def speak
    "Look I'm speaking!"
  end
end

module Swimmable
  include Speakable

  def swim
    "Look I'm swimming!"
  end
end

class Person
  include Swimmable
end

adam = Person.new.speak # => "Look I'm speaking!"

## What are the 3 defining factors to think of when deciding whether to use an interface inheritence of class inheritence?

- Modules cannot be instantiated, so if you would like to instantiate an object with predefiend attrubute and behaviours, you will need to use class inheritence.

- Classes can only inherit from one superclass. However, you can min in as many modules as you would like.

- Modules are used for a 'has-a' relationship, whereas if the relationship is a 'is-a' relationship, it would be more appropriate to use a class.

## Can modules subclass? 

No. Modules, unlike classes, cannot subclass from one another.

```ruby
module Multiplyable
  def self.by_2(value)
    value * 2
  end
end

module Timestwoable < Multiplyable
end

result = Timestwoable::by_2(4) # => syntax error, unexpected '<' module Timestwoable < Multiplyable
```

### What actually is a mixin?

A mixin in a ruby facility to create multiple inheritence.

### How can we find out what sequence the method lookup path takes when searching through modules.

## Polymorphism, Inheritence and Encapsulation

### What is polymorphism?

Polymorphism is ability for different data to respond to a same common interface. Technically, it is our ability to redefine methods for derived classes. Polymorphism can be achieved in three ways through inheritence(interface and hierarchial), method overiding and ducktyping.


### What is ducktyping and can you demonstrate an example of ducktyping?
Ducktyping is the process of calling the same method on a number of objects and giving the object the ability to perform the behaviour, independent of the existing code base and any dependencies. Ruby does not care what the class is only that the method is available to be called from the object.

```ruby
class Introduction
  def self.introduce_the_ducks(ducks)
    ducks.each do |duck|
      duck.quack
    end
  end
end

class BilliamDrakespeare
  def quack
    puts "To Quack of not to Quack? That is the question."
  end
end

class JamesPond
  def quack
    puts "The name is Quack. Quack Quack."
  end
end

Introduction.introduce_the_ducks([BilliamDrakespeare.new, JamesPond.new])
```

### How does class inheritence achieve polymorphism? Can you provide an example? 

Class inheritence allows us to achieve polymorphism by giving us the ability inherit methods from an existing superclass yet use data that is conatined within the object itself.

```ruby
class Car
  attr_reader :number_of_doors
  def initialize(model)
    @model = model
    @number_of_doors = 5
  end

  def door_info
    puts "This car comes with #{number_of_doors} doors"
  end
end

class Astra < Car
  def initialize
    super('Vauxhall Astra')
    @number_of_doors = 3
  end
end

my_car = Astra.new
my_car.door_info
```

In the example above, the `Astra` class is able to inherit the `#door_info` method from it's super class, `Car`, yet is able to use this method in conjuction with it's own data. `@number_of_doors` is assigned the value of 3 and this is the data that is made reference to within the string inerpolation of`#door_info`.  My_car is referencing a `Vauxhall` object which is calling object and where Ruby looks first to find's the data it needs to complete the string interpolation.

### How does method overiding achieve polymorphism? 

Method overiding allows us to achieve polymorphism by having objects overide their built in methods, meaning they are able to respond using their own data to a common interface or method call. 

```ruby
class Car
  def initialize(model, year)
    @model = model
    @year = year
  end
end


astra = Car.new('Astra', 2013)
astra.to_s # => #<Car:0x0000559013e56958>
```
In the example above, calling the `#to_s` method on the object returns the object class and object id within a string object. This is because Ruby is using the `Object#to_s` method that is built in to all objects. In order to make this method more useful, and more user friendly, we can create our own custom `#to_s` method to overide the prexisting method built into the class. For example, we could format the return value to print what the user might expect:

```ruby
class Car
  attr_reader :model, :year
  def initialize(model, year)
    @model = model
    @year = year
  end

  def to_s
    puts <<~HEREDOC
      Model: #{model}
      Year: #{year}
    HEREDOC
  end
end

astra = Car.new('Astra', 2013)
astra.to_s 
# => Model: Astra
#    Year: 2013
```

### Using Super
We can also extend a methods functionality by using the `super` method. When `super` is invoked within a method, ruby traverses the method lookup path to find a method with the same name as the one that `super` has been included with. Once it finds this method, Ruby will invoke it. This allows us to achieve polymorphism as the object is able to interact with a common interface yet use its own data and functionality from within the object.

```ruby
class Vehicle
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Car < Vehicle
  def initialize(name)
    super(name)
    @wheels = 4
  end
end

fiat = Car.new('Punto')
fiat.name

```

In the above, `super` is invoked, when the constructor method `#initialize` is invoked on line 262. As a result, ruby traverses the method lookup path searching for the another method with the same name, `#initialize`,to invoke it. In this case, Ruby finds the method `#initialize` in the superclass `Vehicle` and passes in the sting argument to the method. The parameter `name` now points to the string object within `Vehicle#initialize` and is assigned to the `@name` instance variable. As `Vehicle` has access to the accessor method `attr_reader`, the object that fiat is referencing, is able to call this method and return the value associated with the instance variable as it inherits from the `Vehicle` class. 


### What is encapsulation and can you provide an example of it in use? 

Encaosulation hides the implementation details of a class from other objects within the program. Encapsulation is at its essence data protection. It is the ability to create clearly defined boundaries between objects which only interact through their public interfaces. Encapsulation is a key OOP design princicple and can be achieved through instantiation, access modifiers (public, private and protected methods) and accessor methods. 

### How can you achieve encapsulation through instantiation? 

Instantiation is the process of creating an object from a class. This object is an instance of a class. When an object is instantitated, it is defined with the behaviours and attributes that are contained within the class. As a result, no two objects share data between one another. 

```ruby
class Dog
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

fido = Dog.new('Fido')
hudson = Dog.new('Hudson')

p fido.name #=> 'Fido'
p hudson.name # => 'Hudson'


fido.name = 'Lassey'
p fido.name # => 'Lassey'
p hudson.name # => 'Hudson'
```

Although both objects are instantiated from the same class, once they have been instantiated, they are independent of one another and do not share states. They are independent in terms of their data. 

### How can we achieve encapsulation through accessor methods?

Accessor methods are our ability to both get and set data within an object. This means we're able to expose data from an object and reassign it with new data through the public interface of the object. The types of accessor methods that we decide to include within our class blueprint, and that which objects instatiated from it will have access to, will decide to what extent we can interact with the object.


### Custom getter and setter example: 

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name # => custom getter method
  end

  def name=(name) # => custom setter method
    @name = name
  end
end


richard = Person.new('Richard')
p richard.name # => 'Richard'
richard.name = 'Josh'
p richard.name # => 'Josh'
```

### Accessor methods example:

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

richard = Person.new('Richard')
p richard.name # => 'Richard'
richard.name = 'Josh'
p richard.name # => 'Josh'
```

### How can you achieve encapsulation through the use of access modifiers (public, protect, private)? 

Access modifiers set the visibility of an object's methods and data in relation to other objects. Ruby has 3 access modifiers: public, private and protected. Ruby methods are public unless we say otherwise. 

Public methods can be called from outside of the class, through the public interface, and within the class using the reserved word `self`. 


### Example: Public method

```ruby
class Student
  attr_reader :name, :age

  def initialize(name, age, subject, score)
    @name = name
    @age = age
    @subject = subject
    @score = score
  end

  def student_info # <= Public Method
    puts <<~HEREDOC
    Name: #{name}
    Age: #{age}
    HEREDOC
  end
end

harry = Student.new('Harry Potter', 20, 'Magic', 70)
harry.student_info
```

Private methods can be called within the class but cannot be called from outside the class. Private methods are only able to perform operations within the context of the class. 

### Example: Private Method

```ruby
class Student
  attr_reader :name, :age

  def initialize(name, age, subject, score)
    @name = name
    @age = age
    @subject = subject
    @score = score
  end

  def student_info # <= Public Method
    puts <<~HEREDOC
    Name: #{name}
    Age: #{age}
    HEREDOC
  end

  def display_passed_status
    if score > 80
      puts "#{@name} passed the test"
    else
      puts "#{@name} didn't pass the test"
    end
  end

  private

  attr_reader :score # <= private accessor method
end

harry = Student.new('Harry Potter', 20, 'Magic', 70)

harry.student_info
harry.display_passed_status
```

Protected methods act like private methods when interacting with objects outside of the class but act like public methods within the context of the class.

Protected methods can be called within the literal `self` whereas, prior to Ruby 2.7, `private` methods were unable be called with the literal `self`. 

Protected methods are primarily used when calling a shared method interface between two objects. 

### Example :Protected Method

```ruby
class Student
  attr_reader :name, :age

  def initialize(name, age, subject, score)
    @name = name
    @age = age
    @subject = subject
    @score = score
  end

  def student_info # <= Public Method
    puts <<~HEREDOC
    Name: #{name}
    Age: #{age}
    HEREDOC
  end

  def display_passed_status
    if score > 80
      puts "#{@name} passed the test"
    else
      puts "#{@name} didn't pass the test"
    end
  end

  def enrolled_on_same_course_as(other_student)
    if subject == other_student.subject
      puts "Both students are on the same course."
    else
      puts 'Both students are on different courses.'
    end
  end

  protected

  attr_reader :subject # <= protected accessor method

  private

  attr_reader :score # <= private accessor method
end

alex = Student.new('Alex Ryder', 20, 'English', 86)
harry = Student.new('Harry Potter', 20, 'Magic', 70)

harry.student_info
harry.display_passed_status
harry.enrolled_on_same_course_as(alex)
```

### What is class inheritence and can you provide an example?

Class inheritence is the ability for predefined classes to inherit both behaviours and states from one another. This achieves the design principle of polymorphism within the object orientated paradigm and also allos us to avoid duplication in our code. The 'parent' class is detemined as the `superclass`. A superclass is more general and larger in purpose. The child class is what we would call a `subclass`. This inherits both the behaviours and states from the larger, superclass. A subclass is more highly grained and specific compared to the `superclass`. Ruby supports only single inheritence when it comes to class inheritence. 

### Example: 
```ruby
class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end


class Dog < Animal
  def bark
    puts "woof!"
  end
end

fido = Dog.new('Fido The Dog')
p fido.name # => Fido The Dog
```

In the example above, the superclass `Animal` contains the data and behaviours related to an animal's name. As all animals have names, it seems logical and appropriate to store this data in a more general superclass. The `Dog` class inherits from the `Animal` class, however, it has its own behaviour which is relevant to its class only. For example, the `#bark` method.

When we instantiate a new `Dog` object, Ruby traverses the method lookup path to invoke the `#intitialize` method. As this does not exist in the `Dog` class, moves up the inheritence hierarchy and finds the method within the `Animal` class. Ruby then invokes the method and initializes the instance variable `@name` with the string data that is passed to the method as an argument. As the accessor method attr_reader is available in the `Animal` superclass, we can invoke the getter method `#name` from our `Dog` object and return the data assigned to the instance variable `@name` without needing to duplicate the method in the `Dog` class.

### How can we find out what path Ruby takes to find a method to invoke? 

We can check the method lookup path by invoking the ancestors any class. This will display the search order than Ruby will take when trying to find a method that had been invoked. 

```ruby
module Runnable
  def run
    puts "I'm running!"
  end
end

class Animal
  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  include Runnable

  def speak
    puts 'Meow!'
  end
end

class Dog < Animal
  include Runnable

  def speak
    puts 'woof!'
  end
end

hudson = Dog.new('Hudson')
hudson.speak
hudson.run
Dog.ancestors # => [Dog, Runnable, Animal, Object, Kernel, BasicObject]
```

## What are the two forms inheritence?

The two forms of inheritence are class inheritence and interface inheritence.

Class inheritence works in a verticle fashion, in the sense that a subclass can only inherit from one superclass. We allow classes to inherit from one another when they have a `is a` relationship. The other form of inheritence is interface inheritence and this is achieved by including a module within a class. This means the class has access to the predefined behvaiours that exist within the module. We can think of this as horizontal inheritence. A class can 'mixin' from as many modules as it wants. Modules can use interface inheritence, with one another but cannot use the inheritence operator. 

```ruby
module Speakable
  def speak
    puts "I'm speaking!"
  end
end

module Swimmable
  include Speakable
  
  def swim
    puts "I'm swimming!"
  end
end

class Animal
  include Swimmable

  def initialize(name)
    @name = name
  end
end

dog = Animal.new('Hudson')
dog.speak # => "I'm speaking!"

----------------------------

module Speakable
  def speak
    puts "I'm speaking!"
  end
end

module Swimmable < Speakable
  def swim
    puts "I'm swimming!"
  end
end

class Animal
  include Swimmable

  def initialize(name)
    @name = name
  end
end

dog = Animal.new('Hudson')
dog.speak # => "Syntax Error module Swimmable < Speakable"
```

### What are the important aspects to understand regarding `super`'s functionality? 

Super, when included in an instance method, will search up the method lookup path to find a method that is the same name as the one it has been included in and invoke it. 

If super if left without any parenthesis, it will automatically pass any arguements passed to the original instance method up the method lookup path to the method it is looking to invoke. This may cause unintended consequences. 

### Example:
```ruby
class Vehicle
  attr_reader :model

  def initialize(model)
    @model = model
  end
end

class Car < Vehicle
  def initialize(colour)
    super # => super autmatically passes up the argument to the #initialize higher in the inheritence hierachy.
    @colour = colour
  end
end

astra = Car.new('red')
p astra # => #<Car:0x00005610f1387b58 @model="red", @colour="red">
```

We can indicate to `super`, not to pass any arguments up inheritence hierarchy by including an empty parenthesis.

### Example:
```ruby
class Vehicle
  attr_reader :model
  
  def initialize
    @model = nil
  end
end

class Car < Vehicle
  def initialize(colour)
    super() # => No argument is passed up the inheritence hierarchy but the initialize method is still invoked.
    @colour = colour
  end
end

astra = Car.new('red')
p astra # => #<Car:0x00005610f1387b58 @model="nil", @colour="red">
```

We can also include arugments within the parenthesis which can be passed up to the method higher in the inheritence hierachy. 

### Example:

```ruby
class Vehicle
  attr_reader :model
  
  def initialize(model)
    @model = model
  end
end

class Car < Vehicle
  def initialize(model, colour)
    super(model) # => No argument is passed up the inheritence hierarchy but the initialize method is still invoked.
    @colour = colour
  end
end

astra = Car.new('astra', 'red')
p astra # => #<Car:0x0000558b73596ad8 @model="astra", @colour="red">
```

## Class Variables

Class variables are distinctive in the fact that they are prepended with the `@@` symbols. 

Class variable has two distinctive features, all objects instantiated from the class and the class itself, share one copy of the class variable. If the class variable's value is reassigned, it is changed on all levels of the program making it traversable. However, if the class variable is not defined within the class which is calling it or is in a subclass of that class, the class variable is not available. 

### Example 1:

The class variable `@@class_variable` cannot be accessed by `class_method` as the `@@class_variable` has not been initialized in the `SuperClass` class. As class variables are scoped at the class level, `@@class_variable` is only accessible at the `MyClass` level and that's why Ruby returns an uninitialized class variable error. 

```ruby
class SuperClass
  def self.class_method
    @@class_variable += 1
  end
end

class MyClass < SuperClass
  @@class_variable = 0
  
  def display_class_variable
    p @@class_variable
  end
end


test = MyClass.new
test.display_class_variable
SuperClass.class_method
test.display_class_variable # => uninitialized class variable @@class_variable in SuperClass
```

### Example 2:

In the example below, the class variable `@@class_variable` is scoped at the `SuperClass` level, this means it is accessible to the subclasses that inherit from `SuperClass`. The class `MyClass` can access the class variable defined in the superclass and alter it's value from within the subclass. This also alters `class_variables`'s value in objects that are instantiated from the class. For example, `test`.  

```ruby
class SuperClass
  @@class_variable = 0
end

class MyClass < SuperClass
  
  def display_class_variable
    p @@class_variable
  end
  
  def self.class_method
    @@class_variable += 1
  end
end


test = MyClass.new
test.display_class_variable
MyClass.class_method
test.display_class_variable
```

Moreover, class variable is loaded when it is evaluated by Ruby. Therefore, the class variable comes into existence as soon as the class is defined.

### Practical Case Use for Class Variables

```ruby
class VauxhallCarManufactorer
  @@number_of_cars_produced = 0

  def initialize
    @name = 'Vauxhall'
  end

  def self.make_cars
    5.times do 
      Corsa.new
      Astra.new
    end
  end

  def self.display_cars_made
    p @@number_of_cars_produced
  end
end

class Corsa < CarManufactorer
  def initialize
    @name = 'Corsa'
    @@number_of_cars_produced += 1
  end
end


class Astra < VauxhallCarManufactorer
  def initialize
    @model = 'Astra'
    @@number_of_cars_produced += 1
  end
end


VauxhallCarManufactorer.make_cars
VauxhallCarManufactorer.display_cars_made
```

### What is the difference between a class method and an instance method? 

A class method is only concerned with the class itself and not instances of the class. Therefore, class methods can only be called directly on the class and not an instance of the class. A class method has access to class variables that are within its scope. A class method is prepended with the `self` reserved word.

Example 1:

```ruby
class Car
  @@wheels = 4 

  def self.wheels
    @@wheels
  end
end

p Car.wheels
```

Instance variables and instance methods cannot be called from within a class method as a class method is not defined at the same scope.

### Example: Instance method not accessible within class method: 

```ruby
class Car
 def instance_meth
    'car'
  end
  
  def self.display_name
    instance_meth
  end
end 

p Car.display_name # => NameError
```

### Example: Instance variable not available within the scope of the class method:

```ruby
class Car
  def initialize
    @wheels = 4
  end
  
  def Car.wheels
    p @wheels
  end
end 

corsa = Car.new
Car.wheels # => nil
```

The class method returns `nil` as the instance variable, within the scope if the class method, has not be initialized. Uninitialized instance variables return `nil`. 

However, if you initialize the instance variable with a value, within the scope of the class method, it will return the value assigned to the instance variable. 

### Example: Instance variable available within the scope of the class method:

```ruby
class Car  
  def Car.wheels
    @wheels = 4
    p @wheels
  end
end

Car.wheels # => 4
```

### What level are instance variables scoped at?
Instance variables are scoped at the object level which means that they are avaialable to all instance methods at the scope of the object. Instance variables are not share between objects. This one of the ways that Ruby is able to achieve the encapsualtion priniciple. Instance variables allow us to track the state of an object. 


### What are instance methods? 
Instance methods are methods with are available to the object. They are what would be considered 'behaviours' of the object. Instance methods can be called on the object directly. However, if they are called within another instance method, we must use the reserved word `self.` to indicate to Tuby that we care calling the instance variable and not asking for local variable initilisation and assignment. Instance methods allow us to expose data and perform operations within the object. Instance methods allow us to perform operations from within the object without the existing code base knowing what is happening within the object.

### Example of instance methods and instance variables in use.

```ruby
class Car
  attr_reader :model

  def initialize
    @wheels = 4
    @model = 'Ford'
  end

  def display_wheels # Instance method has access to `@wheels` instance variable even though it is not defined within it. 
    puts @wheels
  end

  def display_model
    puts self.model # Instance method called with `self`
  end
end

corsa = Car.new
corsa.display_wheels
corsa.display_model
```
