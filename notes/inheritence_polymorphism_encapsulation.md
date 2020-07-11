# Inheritence, Encapsulation and Polymorphism

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

# What is the difference between a superclass and a subclass?
A subclass is a lower in the inheritence hierarchy and has access to any of the methods or states that exist in an superclass that it inherits from.

A superclass is a larger, and more general, class that a subclass can inherit from.

In the example above, `Chicken` is the subclass and `Bird` is the superclass. The '<' operator between the two classes signifies the that inheritence is taking place.

# What is the limitation of inheritence?
A subclass can only inherit from one superclass. 

# What are the benefits of using inheritence?
Inheritence allows us to achieve the principle of polymorphism in our code. Moreover, it prevents us from creating duplication throughout our code, which achieves the DRY principle.

# What are some other forms of inheritence and how are they difference from class inheritence?
Another form of inheritence is interface interitence which can be achieved by using a mixin module within a class. This allows a class to interact with the public interface of a module and inherit it's predefined behvaiours. One of the major differences between interface inhertience and class inheritence is that you can mixin in as many modues as you want, however, you can only inherit from one superclass.

# How else can you achieve polymorphism through inheritence?
You can achieve polymorphism through inheritence by having a method in a subclass overide a method in the superclass. This ability to overide methods allows polymorphsim to be achieved as objects are able to individually respond to a method invocation using the same preexisting data.

