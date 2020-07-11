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

The other way to achieve `polymorphism` is through ducktyping. This is the process of giving an object the independence and responsibility to execute it's own behaviours, without relying on dependencies from the existing code base. Essentially, if it's a `duck` it should `quack` like a duck.  

```ruby
class Duck
	def initialize(name)
		@name = name
	end

	def quack
		puts 'To quack or not quack? That is the question.'
	end
end

billiam_drakespeare = Duck.new('Billiam Drakespeare')
billiam_drakespeare.quack
```

# Encapsulation

## What is encapsulation?

Encapsulation is the a form of data protection. It allows us to, using the public interface of the object, expose data and perform operations without the existing code base being aware of the operations and data that is contained within the object. This allows us to clearly define boundaries between objects and build code with greater level of abstraction and complexity. 
