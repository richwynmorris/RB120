# How do we create an object in Ruby? Give an example of the creation of an object.
# To create an object you first must define it as a class. You then can intialize a variable and assign it wtih an instance of the class. This process is called
# instantiation. This means we have instatiated an object called an_object from the class MyFirstClass

# class MyFirstClass
# end

# an_object = MyFirstClass.new


# To create an object you must first define a class using the reserved word class and ending it with the reserved word end. Once you have defined the class, you can 
# then intialiaze a variable and assign it with the instance of the class. This is process is called instantiation. This means we have instatiated the object from
# the MyFirstClass class. 



# What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

# A module is a set of behaviours that are available to class via mixins. Modules allow you to achieve polymorphism and assign inherent traits to a range of classes. 
# This can be achieved by invoking the include method and passing the module to it as an argument. The module must be defined using the reserved word module and using 
# a constant (starts with a captial). 

module Times_two
  def times_two(num)
    p num * 2
  end
end


class MyFirstClass
  include Times_two
end

an_object = MyFirstClass.new

an_object.times_two(2)