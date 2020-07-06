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

# Class Variables

Class variables can be initialized in the body of a class and can be accessed by both class methods and instance methods. Class variables that are initialized in a superclass can also be inherited by a subclass. 

```ruby
class Library
  @@total_books = 0

  def how_many_books
    @@total_books
  end
end

class Book < Library

  def initialize(name)
    @name = name
    @@total_books += 1
  end
end

my_library = Library.new
hitchhikers_guide_to_the_galaxy = Book.new("The Hitchhiker's Guide to the Galaxy")

p my_library.how_many_books # => 1
```

However, if the class variable is modified by another class, the class variable's value will be modified across all objects. This means that if you alter the class variable in one place, it affects in all places. This is why class variables are generally avoided

```ruby
class Library
  @@total_books = 0

  def how_many_books
    @@total_books
  end
end

class Book < Library

  def initialize(name)
    @name = name
    @@total_books += 1
  end
end

class Person < Library
  def initialize
    @@total_books = 0
  end
end

my_library = Library.new
hitchhikers_guide_to_the_galaxy = Book.new("The Hitchhiker's Guide to the Galaxy")
ben = Person.new
p my_library.how_many_books # => Expecting 1, got 0.
```  

# Constants and inheritence
Constants are scoped at the lexical level, meaning they can be accessed by both class methods and instance methods. However, they cannot be accessed between different classes. To do this, you need to call the namespace resolution operator and use this syntax:

```ruby
class::Constant
```

##How do constants work in terms of inheritence? 

Constants that are initialized in a superclass are accessible by a subclass.

```ruby
class Library
  BOOKS = ['deep work', 'presuasion', 'superthinking']
end

class Librarian < Library

  def check_books
    BOOKS.each do |book|
      puts "we have #{book} available"
    end
  end
end

sue = Librarian.new
sue.check_books

# we have deep work available
# we have presuasion available
# we have superthinking available
```

Ruby will first check the lexical scope before checking the inheritence hierarchy. This is called `constant resolution`. This means, if you want to reference a constant that is not intialized in a module, you will need to use the namespace resolution operator to indicate to Ruby where you want it to search of the Constant.

```ruby
module Sortable

  def sort_books
    Library::BOOKS.sort!
  end
end

class Library
  BOOKS = ['superthinking', 'presuasion', 'deep work']
end

class Librarian < Library

  include Sortable

  def check_books
    BOOKS.each do |book|
      puts "we have #{book} available"
    end
  end
end

sue = Librarian.new
sue.check_books
sue.sort_books
p ' '
sue.check_books
``` 

Note: In the above example, the constant is modified which is not recommended. Ruby will throw a warning message if the constant is modified.










