class GuessingGame
  attr_reader :number_to_guess
  attr_accessor :player_answer, :guesses
  RANGE = (0..100).to_a
  
  def initialize
    reset_variables
  end
  
  def clear
    system 'clear'
  end
  
  def reset_variables
    @guesses = 7
    @number_to_guess = RANGE.sample
    @player_answer = nil
  end
  
  def display_remaining_guesses
    puts "You have #{guesses} guesses remaining."
  end
  
  def display_win
    clear
    puts "That's the answer!"
    puts
    puts "You won!"
    sleep 2
  end
  
  def display_loss
    clear
    puts  "You have no more guesses. You lost!"
  end
  
  def player_guess
    loop do
      puts "Enter a number between 1 and 100:"
      self.player_answer = gets.chomp.to_i
      break if RANGE.include?(player_answer)
      puts "Invalid guess."
    end
  end
  
  def correct_answer
    player_answer == number_to_guess
  end
  
  def no_guesses_left
    guesses == 0
  end
  
  def display_hint
    self.guesses -= 1
    if player_answer > number_to_guess
      puts "Your guess is too high."
      sleep 2
    else
      puts "Your guess is too low."
      sleep 2
    end
  end
  
  
  def display_result
    if correct_answer
      display_win
    else
      display_loss
    end
  end
      
    
  def play
    clear
    reset_variables
    loop do
      display_remaining_guesses
      player_guess
      break if correct_answer || no_guesses_left
      display_hint
      clear
    end
    display_result
  end
end


# Number Guesser Part 1

# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!

# Note that a game object should start a new game with a new number to guess with each call to #play.