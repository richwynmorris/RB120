# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new  # Instatiates the local variable 'thing' as a 'Something' object
puts Something.dupdata # The class method 'dupdata' is invoked which returns 'ByeBye'
puts thing.dupdata # As thing as been institated as a 'Something' object is has access to 
# the Something class methods. It invokes the dupdata method which returns 'HelloHello' as
# the instance variable is concatenated together.