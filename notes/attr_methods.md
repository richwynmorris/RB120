# Attribute Accessor Methods

## What are attribute accessor methods?

Attribute accessor methods are build in Ruby getter and setter methods that can be defined within a class They allow us to expose and change an objects state. There are 3 different types of attribute accessor methods: attr_writer, which allows you got change the state of an object; attr_reader which allows you return the state of an object and attr_accessor which allows you to both get and set the state of an object. 

attribute accessor methods, create an instance variable, if it has not already been explicity defined which can be made reference to using a `Symbol` object as a parameter.

```ruby
class Bird
  attr_accessor :name
end

bob = Bird.new
bob.name = 'Bob'
bob.name # => Bob
```

## What can we use attribute accessor methods for?
As mentioned before, we can use accessor methods to both expose and objects state and modify it. It also means that we can use tha method format our instance variables without needing to work the instance variable directly. This is prefered as it means we only need to work with the instance variable in one place rather than throughout our code. This helps use achieve the DRY priniciple.

## How can we call a getter method within a method without Ruby thinkings its assignment?

To call accessor method within another instance method we need to make sure that the getter/setter method is prefixed with `self.`. This indicats to ruby that we're not assigning a local variable with a new instance method but calling the instance method itself. 


## When to use getter and setter methods.

There may be times where we do not want to expose an operation or behaviour within an object to misuse. This means we need to be aware of what methods we are making accessible in the public interface of the object. 

```ruby
class MyAccount
  attr_reader :balance

  def intiialize(new_balance)
  	@balance = 0
  end
end
```

In the example above, we may have a bank account where, when intialized, has the balance of 0. If we allow an accessor method or custom setter method to be defined in the public interface of the object, the object's state, or more specifically it's instance variable `balance`, can be changed. If we only have the `getter` method in the object's public interface, this mean's anything interacting with that object can be exposed to the state but are unable to modify it, therefore protecting the states integrity.

```ruby
class MyAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end
end

bob = MyAccount.new
p bob.balance # => 0
bob.balance = 100 # => NoMethodError
```

## If an attribute accessor method is defined within the object, can you intialize an instance variable outside of the object? 

You can initialize an instance variable outside of the object, even if the instance variable isn't explicit within the instance of the class. 

The accessor methods are build in getter and setter methods that allow us to track and modify an instance variable using the parameter of a `Symbol`. 

Example:

```ruby
class Bird
  attr_accessor :name, :age
end

birdy = Bird.new
birdy.name, birdy.age = 'Birdy', 5 
puts birdy.name # => Birdy
puts birdy.age # => 5
```
