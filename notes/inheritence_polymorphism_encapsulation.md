# Inheritence, Encapsulation and Polymorphism

# Inheritence

## What is the concept of inheritence? 
Inheritence is the ability for a subclass to have access to the behaviours and attributes that are contained within a superclass. This allows classes to build relationships of inheritence and allows programmers to acheive the DRY principle in their programming. 

```ruby
class Bird
	def talk
		puts "What? You've never seen a talking Chicken before?"
	end
end

class Chicken < Bird
	def initialize(name)
		@name = name
	end
end

bob = Chicken.new('Bob')
bob.talk #=> "What? You've never seen a talking Chicken before?"
```

## What is the benefit of using inheritence?
Inheritence allows us to order our program using a hierarchical structure and avoids duplication throughout our code. Moreover, inheritence allows us to achive the principle of polymorphism in program and we're able to build relationships between subclasses and superclasses in our program. 

## What operator is used to show a subclass inheriting from a superclass?
`<`

## What is the method lookup path?
The method lookup path is the hiearchial structure that Ruby traverses when searching for a method that has been called. It will begin by searching in the calling object and will then move up the inheritence hierarchy, searching through superclasses and modules, until either the method is found and invoked or Ruby returns a `NoMethodError`.


## What is `super`?
`super` is a built in Ruby method which allows you to invoke a method with the same name that `super` is defined within that is higher in the inheritence hierarchy. Ruby will search the inheritence hierachy to find the method with the same name until it is either found or it returns nil.

```ruby
class Bird
	def initialize
		puts "You called the initialize method in the Bird class!"
	end
end

class Penguin < Bird
	def initialize
		super
	end
end

pingu = Penguin.new # => You called the initialize method in the Bird class!
```

## Why is it important to consier the arguements you pass to super?
When you pass an argument to super, and that argument is passed up the inheritence hierarchy, you may be inadvertandly assigning instance variables with values that are untintention. 

Example
```ruby
class Bird
  def initialize(name)
    @name = name
  end
end

class Penguin < Bird
  def initialize(age)
    super
    @age = age 
  end

  def info
    self
  end
end

pingu = Penguin.new(4)
p pingu.info # => #<Penguin:0x0000559c228d10a8 @name=4, @age=4>
```




## What is multiple inheritence?
Multiple inhertence means a class both inherits from a superclass but also has access to the interface inheritence of a module that has been mixed into that class. 

## What is the difference between a superclass and a subclass?
A subclass is a lower in the inheritence hierarchy and has access to any of the methods or states that exist in an superclass that it inherits from.

A superclass is a larger, and more general, class that a subclass can inherit from.

In the example above, `Chicken` is the subclass and `Bird` is the superclass. The '<' operator between the two classes signifies the that inheritence is taking place.

## What is the limitation of inheritence?
A subclass can only inherit from one superclass. 

## What are the benefits of using inheritence?
Inheritence allows us to achieve the principle of polymorphism in our code. Moreover, it prevents us from creating duplication throughout our code, which achieves the DRY principle.

## What are some other forms of inheritence and how are they difference from class inheritence?
Another form of inheritence is interface interitence which can be achieved by using a mixin module within a class. This allows a class to interact with the public interface of a module and inherit it's predefined behvaiours. One of the major differences between interface inhertience and class inheritence is that you can mixin in as many modues as you want, however, you can only inherit from one superclass.

## How else can you achieve polymorphism through inheritence?
You can achieve polymorphism through inheritence by having a method in a subclass overide a method in the superclass. This ability to overide methods allows polymorphsim to be achieved as objects are able to individually respond to a method invocation using the same preexisting data.


## What are the two ways you can achieve polymorphism? 
You can achive polymorphism through class inhertience and overiding methods. Moreover, you can achieve polymorphism through ducktyping. 

class inheritence/overiding methods

```ruby
class Animal 
  def initialize(name)
    @name = name
    puts "Birdy was initialized in the Animal class!"
  end

  def talk
    puts "I'm an animal!"
  end
end

class Bird < Animal
  def talk
    puts "But I'm talking from the Bird class!"
  end
end

birdy = Bird.new('Birdy')
birdy.talk
```

In the above example we can see that `Bird` inherits from the `Animal` class as they have a 'is-a' relationship. As a result, we're able to take the more general class of the `Animal` and allow any instances the `Bird` class to inherit applicable states such as `name` from the Animal class. 

Moreover, we're also able to overide the `#talk` method which exists in the the `Animal` superclass but also exists in the `Bird` subclass. When a method is invoked, Ruby traverses the inheritence hierarchy, starting with the object that invoked the method. Once it finds it, it invokes it. As `#talk` was found in the calling object ('birdy'), it is executed first before Ruby continues searching the rest of the method lookup path. This means we're able to interact with objects in many different forms, using the same operator or fuction and thereby achieving the principle of polymorphism. 

The other way to achieve `polymorphism` is through ducktyping. This is the process of giving an object the independence and responsibility to execute it's own behaviours, without relying on dependencies from the existing code base. You can call the same method name on a range of difference objects and object will perform the operation based on what it is. 

```ruby
class MeetTheDucks
  def introduce_yourselves(ducks)
    ducks.each do |duck|
      duck.quack
    end
  end
end

class Billiam_Drakespeare
  def quack
    puts 'To quack or not quack? That is the question.'
  end
end

class Chewquacker
  def quack
    puts 'qqqqquuuaaarrccchhhhwwaarr!!'
  end
end

class James_Pond
  def quack
    puts "The name's quack. Quack quack."
  end
end

ducks = [Billiam_Drakespeare.new, Chewquacker.new, James_Pond.new]
meet_ducks = MeetTheDucks.new
meet_ducks.introduce_yourselves(ducks)

```

# Encapsulation

## What is encapsulation?

Encapsulation is the a form of data protection. It allows us to, using the public interface of the object, expose data and perform operations without the existing code base being aware of the operations and data that is contained within the object. This allows us to clearly define boundaries between objects and build code with greater level of abstraction and complexity. 
