class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def >(other_move)
    if @beats.include?(other_move.to_s)
      return true
    end
    false
  end

  def to_s
    @value
  end
end

# ------------------------------

class Rock < Move
  def initialize
    @value = 'rock'
    @beats = ['scissors', 'lizard']
  end
end
# ---------------------------

class Spock < Move
  def initialize
    @value = 'spock'
    @beats = ['rock', 'scissors']
  end
end
# ---------------------------

class Lizard < Move
  def initialize
    @value = 'lizard'
    @beats = ['spock', 'paper']
  end
end
# ---------------------------

class Paper < Move
  def initialize
    @value = 'paper'
    @beats = ['rock', 'spock']
  end
end
# ---------------------------

class Scissors < Move
  def initialize
    @value = 'scissors'
    @beats = ['lizard', 'paper']
  end
end

# ----------------------------

class Scoreboard
  attr_reader :human_score, :computer_score

  def initialize
    @human_score = 0
    @computer_score = 0
  end

  def update(player)
    @human_score += 1 if player.class == Human
    @computer_score += 1 if player.class == Computer
  end

  def display(human, computer)
    puts "#{human}'s Score: #{human_score}"
    puts "#{computer}'s Score: #{computer_score}"
    puts
  end

  def winner?
    @human_score == 10 || @computer_score == 10
  end
end

# -------------------------------

class Player
  attr_accessor :move, :name, :move_history, :turn

  def initialize
    @move = nil
    set_name
    @move_history = []
    @turn = 1
  end

  OBJECTS = { 'rock' => Rock.new, 'paper' => Paper.new,
              'scissors' => Scissors.new, 'spock' => Spock.new,
              'lizard' => Lizard.new }

  def add_to_history
    move_history << "Turn #{turn}: #{move}"
    @turn += 1
  end

  def display_history
    puts "#{name} = #{move_history}"
  end

end

# ------------------------------

class Human < Player
  def set_name
    puts "What's your name human?"
    answer = gets.chomp
    self.name = answer
  end

  def choose
    choice = nil
    loop do
      puts "Please choose Rock, Paper, Scissors, Spock or Lizard:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, Invalid choice. Please try again."
    end
    self.move = OBJECTS[choice]
    self.add_to_history
  end
end

# -------------------------------
class Computer < Player
  def set_name
    self.name = ['C3PO', 'R2D2', 'WALL-E', 'Optimus Prime'].sample
  end

  def choose
    self.move = OBJECTS.values.sample
    self.add_to_history
  end
end

# ------------------------------

class RPSGame
  attr_accessor :human, :computer, :scoreboard

  def initialize
    @human = Human.new
    @computer = Computer.new
    @scoreboard = Scoreboard.new
  end

  def display_greeting_message
    "Welcome to Rock, Paper, Scissors, Spock, Lizard."
  end

  def display_moves
    puts "You chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
    puts
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      scoreboard.update(@human)
    elsif computer.move > human.move
      puts "#{computer.name} won!"
      scoreboard.update(@computer)
    else
      puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thank you for playing, #{human.name}. Goodbye!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again #{human.name}? y for yes, n for no."
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts 'Must be y or n'
    end

    return true if answer.downcase == 'y'
  end

  def display_scoreboard
    scoreboard.display(human.name, computer.name)
  end

  def display_histories
    human.display_history
    puts
    computer.display_history
    puts
  end

  def play
    display_greeting_message
    loop do
      loop do
        human.choose
        computer.choose
        system 'clear'
        display_moves
        display_winner
        display_scoreboard
        display_histories
        break if scoreboard.winner?
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

# ------------------------------

RPSGame.new.play