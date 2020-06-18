# Question 1

# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1: => "Hello"

hello = Hello.new
hello.hi

# case 2: => #UndefinedMethod

hello = Hello.new
hello.bye

# case 3:

hello = Hello.new #Wrong number of rguments
hello.greet

# case 4: => "Goodbye"

hello = Hello.new
hello.greet("Goodbye") 

# case 5: => UndefinedMethod = No class method called 'hi'

Hello.hi