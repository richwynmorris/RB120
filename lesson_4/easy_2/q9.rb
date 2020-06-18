# Question 9

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# If a #play method is added to the Bingo class, this particular method within the Bingo class would be invoked first as Ruby checks the class that the method was invoked in first before
# moving up the inheritence hierarchy. As it is present in the Bingo class, it is never invoked in the Game class. 