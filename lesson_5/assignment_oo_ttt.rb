# Write up:
# Tic-tac-toe is a two player board game set on a 3X3 grid. Players take turns
# marking a square. The first player to mark 3 squares in a row wins.

# Nouns: player, board, grid, square,
# Verbs: mark, play

# (board and grid as refering to the same object.)

# Board
# Square
# Player
# - marks
# - plays

class Scoreboard
  attr_reader :human_score, :computer_score

  def initialize
    @human_score = 0
    @computer_score = 0
  end

  def update(marker)
    if marker == TTTGame::HUMAN_MARKER
      @human_score += 1
    elsif marker == TTTGame::COMPUTER_MARKER
      @computer_score += 1
    end
  end

  def reset
    @human_score = 0
    @computer_score = 0
  end

  def display
    spaces = ' ' * 11
    puts "********************************************"
    puts "*               SCOREBOARD                 *"
    puts "*#{spaces}HUMAN: #{human_score} COMPUTER: #{computer_score}#{spaces}*"
    puts "*                                          *"
    puts "********************************************"
  end

  def winner?
    @human_score == 5 || @computer_score == 5
  end


end

class Board
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                       [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                       [[1, 5, 9], [3, 5, 7]] # diags

  INITIAL_MARKER = ' '

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts <<~PRINT_BOARD
         |     |
      #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}
         |     |
    -----+-----+-----"
         |     |
      #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}
         |     |
    -----+-----+-----"
         |     |
      #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}
         |     |
    
    PRINT_BOARD
  end

  def [](square)
    @squares[square].marker
  end

  def []=(square, marker)
    @squares[square].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, values| values.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_CONDITIONS.each do |line|
      squares = check_squares(line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def threat_or_opportunity?(marker)
    WINNING_CONDITIONS.each do |line|
      squares = check_squares(line)
      markers = get_markers(squares)
      if markers.count(marker) == 2
        squares.each_with_index do |square, index|
          return line[index] if square.unmarked?
        end
      end
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = get_markers(squares)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def check_squares(line)
    @squares.values_at(*line)
  end

  def get_markers(squares)
    squares.select(&:marked?).collect(&:marker)
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker= INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :marker, :computer, :scoreboard

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @scoreboard = Scoreboard.new
  end

  def play
    clear
    display_greeting_message
    main_game
    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def display_greeting_message
    puts "Welcome to Tic-Tac-Toe!"
    puts
  end

  def display_goodbye_message
    clear
    puts "Thanks for playing Tic-Tac-Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_board
    puts
    puts "Your're a #{human.marker}. Computer is a #{computer.marker}"
    puts
    board.draw
    puts
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def join_or
    if board.unmarked_keys.length == 1
      board.unmarked_keys.last.to_s
    else
      "#{board.unmarked_keys[0..-2].join(', ')} or #{board.unmarked_keys.
      last.to_s}"
    end
  end

  def human_moves
    puts "Choose a square: " + join_or
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry that's not a valid answer. Try again."
    end
    board[square] = human.marker
  end

  def computer_moves
    potential_win = board.threat_or_opportunity?(computer.marker)
    potential_loss = board.threat_or_opportunity?(human.marker)

    if potential_win
      board[potential_win] = computer.marker
    elsif potential_loss
      board[potential_loss] = computer.marker
    elsif board[5] == Square::INITIAL_MARKER
      board[5] = computer.marker
    else
     board[board.unmarked_keys.sample] = computer.marker
    end
    
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when HUMAN_MARKER
      puts "You won!"
    when COMPUTER_MARKER
      puts "Computer won!"
    else
      puts "It's a tie!"
    end

    sleep 4
  end

  def update_scoreboard
    scoreboard.update(board.winning_marker)
  end

  def display_scoreboard
    clear
    scoreboard.display
    sleep 4
  end


  def main_game
    loop do
      display_board
      player_move
      clear
      display_result
      update_scoreboard
      display_scoreboard
      break if winner?
      reset
    end
    another_round?
  end

  def another_round?
    reset
    scoreboard.reset
    if play_again?
      clear
      display_play_again_message
      main_game
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %('y', 'n').include?(answer)
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def winner?
    scoreboard.winner?
  end

end

game = TTTGame.new
game.play
