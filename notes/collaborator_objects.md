## Collaborator Objects

What is a collaborator object?
A collaborator object is an object which exists as a `state` within another object. More specifically it is an instance variable that has been assigned a class object. This creates a relationship of association between two objects and thus creates a collaboration between them. 

Example:

```ruby
class Dog
  def initialize(name)
    @name = name
  end
end

class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
    @pet = nil
  end
end

bob = Person.new('Bob')
bob.pet = Dog.new('Bobby')
p bob.pet # => #<Dog:0x00005566bb51b090 @name="Bobby">
```

In the example above, the instance variable `@pet` is assigned a new `Dog` object. This `Dog` object now exists as state within the `Person` object. This is now a collaborator object as the objects have a relationship of association. 

You can not only create collaborator objects using custom objects, but you can also create collaborator objects using the built in ruby classes. 

Example:

```ruby
class Person
  def initialize(name)
  	@name = name
  end
end

bob = Person.new('Bob')

# @name => String => 'Bob' 
```

In the example above, the instance variable `name` is assigned a `String` class and which contains the string data 'Bob'. As the `String` class is being assigned to an instance variable within the `Person` class. This again creates a relationship of association between the two classes.



