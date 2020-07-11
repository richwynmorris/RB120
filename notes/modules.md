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