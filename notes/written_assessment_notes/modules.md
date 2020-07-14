# Modules

## What are the three things you should consider when deciding to either user a mixin module or class inheritence?

You should consider the following factors when deciding which path to take:
 
- Classes can only inherit from one superclass however you can mix in as many modules as you want. 
- You cannot instantiate a module, so if you wish you instantiate an object with attributes and behaviours, you will need to use class inheritence.
- Deciding what the relationship is can also help when deciding what inheritence to use. For example, if it is a 'has-a' relationship, it is better to 
use the interface inheritance of a module. However, if it is a 'is-a' relationship, it is better to use class inheritence. 

## What is namespacing in regard to modules? 

Namespacing is collecting a group of classes that have an association with one another under a single module. This is useful as it allows the programmer to create logical relationships between classes and avoids classes colliding in the program. 

Example: 

```ruby
module Animals
	 class Bird ; end
	 class Human
	   def initialize
	     puts "Hello, I'm a human!"
	   end
	 end
	 class Dog ; end
end

Animals::Human.new # => Hello!, I'm a human!
```

## How do you call class conatined within a module? 

You need to use the namespace operator ::

```ruby
module Mammal
	class Dog
		def self.speak
			puts 'Woof!'
		end
	end
	class Cat
		def self.speak
			puts 'Meow!'
		end
	end
end

Mammal::Dog.speak # => Woof!
Mammal::Cat.speak # => Meow! 
```

## Does Ruby check the object first or the module contained within the object first when traversing up the method lookup path?

Ruby will check the object which invoked the method first before checking any modules interfaces that are contained within the object. 

## What is the common naming method for modules? 

Modules start with a the reserved word `module` followed by a verb that describes the behaviours contained within the module. The module
will start with a capital letter and the verb will be suffixed with 'able'. For examples `Walkable`. 

## What is interface inheritence ?
Interface inheritence is the ability for a class to inherit the interface and behaviours of a module. This means the class can then perform
the operations from the behaviours that are contained within the module. 

## If there are mulitple modules included in a class, which one does Ruby look in furst when trying to find the method invoked? 
Ruby will search through the modules in the reverse order in which they were included in the class. To verify this, we can call the `#ancestors` method.

```ruby 
module Firstable ; end
module Secondable ; end
module Thirdable ; end

class Example
	include Firstable
	include Secondable
	include Thirdable
end

Example.ancestors # => [Example, Thirdable, Secondable, Firstable, Object, PP::ObjectMixin, Kernel, BasicObject]
```

## What are the two reasons for using modules?

Modules can be used to namespace related classes together into a collection. Moreover, they can also be used to group common behaviours together in module which they can be included in a class using interface inheritence. 

## Are modules in superclasses available in subclasses? 

Yes they are available in subclasses, as when the method is invoked, Ruby travereses the method lookup path, searching both superclasses and the modules that are conatined within those superclasses for the method name. You can see this when you invoke the ancestors method on a class. 