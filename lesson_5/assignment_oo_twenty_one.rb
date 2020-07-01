require 'yaml'

module Displayable
  TEXT = YAML.load_file('instructions.yml')

  def display
    spaces = ' ' * 11
    puts "********************************************"
    puts "*               SCOREBOARD                 *"
    puts "*#{spaces}Player: #{player_score} Dealer: #{dealer_score}#{spaces} *"
    puts "*                                          *"
    puts "********************************************"
  end

  def display_hit
    clear
    puts "#{name} hits!"
    sleep 2
  end

  def display_stick
    clear
    puts "#{name} stuck!"
    sleep 2
  end

  def display_busted_player
    clear
    puts "#{name} busted!"
    sleep 2
    puts
    show_cards
    total
    sleep 4
    clear
  end

  def show_cards
    puts "#{name}'s cards: #{hand.join(', ')}."
  end

  def display_instructions
    puts TEXT
    answer = gets.chomp.downcase
    clear if ['p', 's'].include?(answer)
  end

  def display_busted(participent)
    participent.display_busted_player if busted?(participent)
    clear
    puts 'You won!' if dealer.busted?
    puts 'Dealer won!' if player.busted?
    sleep 2
  end

  def display_twentyone
    return unless twentyone?
    clear
    puts "You got 21!"
    sleep 2
  end

  def display_turn(participent)
    puts "#{participent.name}'s turn:"
    puts
    sleep 2
  end

  def display_winner
    if @winner.nil?
      puts "It's a tie!"
    else
      puts "#{winner} won!"
    end
    sleep 1
  end

  def display_grand_winner
    spaces = ' ' * 10
    spaces_name = ' ' * ((32 - @grand_winner.length) / 2)
    full_spaces = ' ' * 32
    line = '*' * 34
    puts <<~DISPLAY_WINNER
    #{line}
    *#{spaces}GRAND WINNER#{spaces}*
    *#{spaces_name}#{(@grand_winner)}#{spaces_name}*
    *#{full_spaces}*
    #{line}
    DISPLAY_WINNER
    sleep 4
  end
end

class Scoreboard
  include Displayable

  attr_accessor :player_score, :dealer_score

  def initialize
    @player_score = 0
    @dealer_score = 0
  end

  def update(participent)
    if participent.class == Player
      @player_score += 1
    elsif participent.class == Dealer
      @dealer_score += 1
    end
  end

  def check_for_winner
    player_score == Game::ROUNDS || dealer_score == Game::ROUNDS
  end

  def reset
    @player_score = 0
    @dealer_score = 0
  end
end

class Participant
  include Displayable

  attr_accessor :hand, :total_hand

  def initialize
    @hand = []
    @total_hand = 0
  end

  def clear
    system 'clear'
  end

  def hit(deck)
    hand << deck.top_card
  end

  def busted?
    reset_total_hand
    calculate_total
    @total_hand > Game::WINNING_CONDITION
  end

  def total
    reset_total_hand
    calculate_total
    puts "#{name}'s total is #{total_hand}"
    sleep 1
  end

  def calculate_total
    hand.each do |card|
      @total_hand += 11 if card.value == 'Ace'
      @total_hand += 10 if ['Jack', 'Queen', 'King'].include?(card.value)
      @total_hand += card.value if (2..9).to_a.include?(card.value)
    end
    check_aces
  end

  def check_aces
    aces = hand.count do |card|
      card.value == "Ace"
    end
    aces.times do
      @total_hand -= 10 if total_hand > Game::WINNING_CONDITION
    end
  end

  def reset_total_hand
    @total_hand = 0
  end

  def reset_hand
    @hand = []
    reset_total_hand
  end
end

class Player < Participant
  include Displayable

  attr_accessor :hand, :name, :choice

  def initialize
    super
    @name = name
    @choice = nil
  end

  def assign_player_choice
    loop do
      @choice = gets.chomp.downcase
      break if ['h', 's'].include?(choice)
      puts "Sorry, that's not a valid answer. Try again."
    end
  end

  def hit_or_stick(deck)
    puts "Hit or stick? h for hit, s for stick"
    assign_player_choice
    if choice == 'h'
      hit(deck)
      display_hit
    elsif choice == 's'
      display_stick
    end
  end
end

class Dealer < Participant
  include Displayable

  attr_reader :name, :choice

  def initialize
    super
    @name = 'Dealer'
    @choice = nil
  end

  def deal_initial_cards(player, deck)
    2.times do
      player.hand << deck.top_card
      hand << deck.top_card
    end
  end

  def hit_or_stick(deck)
    if total_hand < 17
      @choice = 'h'
      hit(deck)
      display_hit
      clear
    elsif total_hand >= 17 && total_hand <= Game::WINNING_CONDITION
      @choice = 's'
      display_stick
    end
  end
end

class Deck
  include Displayable

  attr_accessor :remaining_cards, :card

  def initialize
    @remaining_cards = {}
    reset
  end

  def top_card
    @remaining_cards.reject! { |_, v| v == [] }
    suit = remaining_cards.keys.sample
    value = remaining_cards[suit].sample
    @card = Card.new(suit, value)
    remove_card_from_deck(card)
    card
  end

  def remove_card_from_deck(card)
    @remaining_cards.values_at(card.suit).delete(card.value)
  end

  def reset
    @remaining_cards = { 'Hearts': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack',
                                    'Queen', 'King'],
                         'Spades': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack',
                                    'Queen', 'King'],
                         'Diamonds': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack',
                                      'Queen', 'King'],
                         'Clubs': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack',
                                   'Queen', 'King'] }
  end
end

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "The #{value} of #{suit}"
  end
end

class Game
  include Displayable

  ROUNDS = 5
  WINNING_CONDITION = 21

  attr_accessor :deck, :player, :dealer, :winner, :scoreboard, :grand_winner

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @scoreboard = Scoreboard.new
    @grand_winner = nil
  end

  def start
    introduction
    main_game
    goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def introduction
    welcome
    assign_name
    greet_player
    display_instructions
  end

  def welcome
    clear
    puts "Welcome to the Twenty One Game! Let's get started!"
    sleep 2
    clear
  end

  def assign_name
    puts "What's your name, stranger?"
    answer = ''
    loop do
      answer = gets.chomp
      break if answer.chars.all? { |char| char != ' ' }
      puts "Sorry, I need a valid name."
    end
    player.name = answer
    clear
  end

  def greet_player
    puts "Nice to meet you, #{player.name}!"
    sleep 2
    clear
  end

  def deal_cards
    dealer.deal_initial_cards(player, deck)
  end

  def show_cards(participent)
    participent.show_cards
  end

  def show_total(participent)
    participent.total
  end

  def hit_or_stick_player
    player.hit_or_stick(deck)
  end

  def hit_or_stick_dealer
    dealer.hit_or_stick(deck)
  end

  def busted?(participent)
    participent.busted?
  end

  def stick?(participent)
    participent.choice == 's'
  end

  def twentyone?
    player.total_hand == 21
  end

  def player_turn
    loop do
      display_turn(player)
      show_cards(player)
      show_total(player)
      puts ''
      hit_or_stick_player
      break if stick?(player) || busted?(player) || twentyone?
    end
    display_twentyone
    display_busted(player)
  end

  def dealer_turn
    loop do
      display_turn(dealer)
      hit_or_stick_dealer
      break if stick?(dealer) || busted?(dealer)
    end
    display_busted(dealer)
  end

  def show_result
    find_winner
    clear
    show_total(player)
    show_total(dealer)
    puts
    display_winner
    sleep 4
  end

  def find_winner
    @winner = nil
    if player.total_hand > dealer.total_hand
      @winner = player.name
    elsif player.total_hand < dealer.total_hand
      @winner = dealer.name
    end
  end

  def grand_winner?
    scoreboard.check_for_winner
  end

  def return_grand_winner
    @grand_winner = player.name if scoreboard.player_score == ROUNDS
    @grand_winner = dealer.name if scoreboard.dealer_score == ROUNDS
  end

  def play_again?
    clear
    puts "Would you like to play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "That's not a valid answer. Please try again."
    end
    answer == 'y'
  end

  def goodbye_message
    clear
    puts 'Thank you for playing the 21 game! Goodbye!'
  end

  def update_when_busted
    if player.busted?
      scoreboard.update(dealer)
    elsif dealer.busted?
      scoreboard.update(player)
    end
  end

  def update_when_winner
    if winner == player.name
      scoreboard.update(player)
    elsif winner == dealer.name
      scoreboard.update(dealer)
    end
  end

  def update_scoreboard
    if player.busted? || dealer.busted?
      update_when_busted
    else
      update_when_winner
    end
  end

  def display_scoreboard
    clear
    scoreboard.display
    sleep 3
  end

  def reset_game
    player.reset_hand
    dealer.reset_hand
    deck.reset
  end

  def reset_scoreboard
    scoreboard.reset
  end

  def turns
    loop do
      deal_cards
      clear
      player_turn
      break if busted?(player)
      dealer_turn
      break if busted?(dealer)
      show_result
      break
    end
  end

  def end_game
    update_scoreboard
    display_scoreboard
    reset_game
  end

  def show_grand_winner_and_reset
    return_grand_winner
    clear
    display_grand_winner
    reset_scoreboard
  end

  def main_game
    loop do
      loop do
        turns
        end_game
        break if grand_winner?
      end
      show_grand_winner_and_reset
      break unless play_again?
    end
  end
end

Game.new.start
