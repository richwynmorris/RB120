# Getters and Setters

## How do you call setter method? 

To call a custom setter method, you need to define the method within the class body using the method name, the `=` operator and the parameter that will be used to reference any argument that's input. 

```ruby
class Bird
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def change_name=(new_name)
		@name = new_name
	end
end

robin = Bird.new('Rob')
puts robin.name # => Rob
robin.change_name = 'Red'
puts robin.name # => Red
```

## How do you call a getter method without using an accessor method?

To call a getter method without using an accessor method, we define an instance method with the class body and make reference to the instance variable we wish to expose the data of. Instance variables are accessible at the object level which means we can make reference to them with any instance method.

Example:

```ruby
class Bird
	def initialize(name)
		@name = name
	end

	def name
		@name
	end
end

robin = Bird.new('Rob')
puts robin.name # => Rob
```




