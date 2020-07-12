# Public, Private and Protected

## What is a public method?

A public method is an instance method which can be invoked through the public interface of the class. This means it can expose data and modify the states of the object.


## What is a private method? 

A private method is a method whichm#, when when invoked, has all subsequent methods beneath it hidden from the public interface of the object. This means the methods contained beneath `private` are not accessible to the existing codebase and thus are not accesible outside of the object. This allows us to keep private the functionality of the object and any data within it. 


## Can you call a private method with `self`? 

Prior to Ruby 2.7, you couldn't as `self` refers to the object itself. Thus if the object is calling a private method from outside the scope of the object, it cannot be accessed and `private method called` error is returned. However, I believe this now been modified and you can now do this. 

## What is a protected method? 

A protected method can be called within the the object itself, like a public method. However, it cannot be called outside of the object, like a private method. This allows us to keep data private whilst being able to perform operations within the object. This allows objects of the same class to use the same operations without exposing the data to the existing codebase. 


## Give an example of a `public` method:

```ruby
class Person
	attr_reader :name, :age 
	def initialize(name, age)
		@name = name
		@age = age
	end

	def greet
		puts "Hello my name is #{name} and I'm #{age} years old."
	end
end

john = Person.new('John', 34)
john.greet # => Hello my name is John and I'm 34 years old.
```

## Give an example of a `private` method:
```ruby
class Person
  attr_reader :name, :age 
  def initialize(name, age)
    @name = name
    @age = age
    @account_number = generate_account_number
  end

  def greet
    puts "Hello my name is #{name} and I'm #{age} years old."
  end

  def display_account_number
    puts "#{name}'s account number is XXXX-XXX-" + last_three_digits
  end

  private

  def last_three_digits
    @account_number.slice(-3..-1)
  end

  def generate_account_number
    "#{rand(1000..9999)}-#{rand(100..999)}-#{rand(100..999)}"
  end
end

john = Person.new('John', 34)
john.display_account_number
```



## Give an example of a `protected` method:
```ruby
class Person
  attr_reader :name, :age 
  def initialize(name, age, balance)
    @name = name
    @age = age
    @account_number = '1234-567-890'
    @balance = balance
  end

  def greet
    puts "Hello my name is #{name} and I'm #{age} years old."
  end

  def display_account_number
    puts "#{name}'s account number is XXXX-XXX-" + last_three_digits
  end

  def >(other)
  	balance > other.balance
  end 

  protected
  attr_reader :balance

  private

  def last_three_digits
    @account_number.slice(-3..-1)
  end
end

john = Person.new('John', 34, 80)
tom = Person.new('Tom', 44, 100)
p tom > john # => true
```





