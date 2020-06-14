class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    value == 'scissors'
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def >(other_move)
    if (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
      return true
    end
    false
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    @move = nil
    set_name
  end
end

class Human < Player
  def set_name
    puts "What's your name human?"
    answer = gets.chomp
    self.name = answer
  end

  def choose
    choice = nil
    loop do
      puts "Please choose Rock, Paper or Scissors"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, Invalid choice. Please try again."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['C3PO', 'R2D2', 'WALL-E', 'Optimus Prime'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_greeting_message
    "Welcome to Rock, Paper, Scissors"
  end

  def display_moves
    puts "You chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
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

  def play
    display_greeting_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
