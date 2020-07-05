# Instance Variables 

We know that instance variables are scoped at the object level. The question to ask is; are instance variables that are initialized in a superclass also available in a subclass. Let's look at an example to see:

```ruby
class Bird
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

class Penguin < Bird
  def waddle
    puts 'waddle waddle'
  end
end

pingu = Penguin.new('Pingu')
pingu.name # => 'Pingu'
```

Clearly, we can see that instance variables that are initialized in a superclass are also available in the subclass, so long as the subclass inherits from the superclass. 

However, what happens in the following code? 

```ruby
class Bird
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

class Penguin < Bird
  def initialize(name) ;end
  
  def waddle
    puts 'waddle waddle'
  end
end

pingu = Penguin.new('Pingu')
pingu.name # => nil
```

In the above code, as the `String` object is not initialized with the instance variable `@name` in the superclass, the instance variable `@name` is accessible, but as the initialize method in the `Penguin` class overides the initialize method in the `Bird` class, the `Bird` class intialize method never received the argument sent to it. Therefore, `@name` returns `nil` as an unitialized instance variable always returns `nil`.
