# Complete this program so that it produces the expected output:

class Book
  attr_accessor :title, :author
  
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Added the attr_accessor method for the user to both read and write tha values that are 
# associated with each instance variable within the object. This allows the states of object 
# to be manipulated easily. 
