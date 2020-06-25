# Write up

# 21 is a game consisting of a dealer and a player. where the 
# participents try to get as close to 21 without going over.

# Overview:
# Both players are initially dealt 2 cards from a deck of 52 cards.
# The player takes the first turn and can either 'stick' or 'hit'.
# If the player busts, he loses. If he sticks it is the dealers turn.
# The dealer must hit until his cards either match or exceed the value of 17.
# If he busts, the player wins. 
# if both the player and the dealer stick, the player with the highest total wins.
# If both totals are the same, it is a tie and nobody wins. 

# Nouns: participent, player, dealer, deck, cards, game, total
# Verbs: deal, hit, stick, busts, 

# States:
# Player:
# - hit
# - stick 
# - busted?
# - total

# Dealer:
# = hit
# - stick
# - busted?
# - total
# - deal

# Participent

# Deck
# - deal (should this be here or in dealer?)

# Card

# Game
# - start

class Participant
  attr_accessor :hand, :total_hand
  
  def initialize
    @hand = []
    @total_hand = 0
  end

  def hit(deck)
    hand << deck.top_card
    puts "#{name} hits!"
    puts
    sleep 2
  end

  def stick
    puts "#{name} stuck!"
  end

  def display_busted
    puts "Too bad! #{name} busted!"
  end

  def busted?
    calculate_total
    @total_hand > Game::WINNING_CONDITION
  end

  def total
    calculate_total
    puts "Your total is #{total_hand}"
  end

  def calculate_total
    reset_total_hand
    hand.each do |card|
      if card.value == 'Ace' 
        @total_hand += 11
      elsif ['Jack', 'Queen', 'King'].include?(card.value)
        @total_hand += 10 
      else
        @total_hand += card.value
      end
    end
    check_aces
  end

  def check_aces
    hand.flatten.count('Ace').times do
      @total_hand -= 10 if total_hand > Game::WINNING_CONDITION
    end
  end

  def reset_total_hand
    @total_hand = 0
  end
end

class Player < Participant
  attr_accessor :hand, :name

  def initialize
    super
    @name = name
  end
  
  def show_cards
    puts "Your cards: #{hand.join(', ')}"
    sleep 2
  end

  def hit_or_stick(deck)
    puts "Hit or stick?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['hit', 'stick', 'h', 's'].include?(answer)
      puts "Sorry, that's not a valid answer. Try again."
    end

    return 'stick' if answer != 'hit'

    hit(deck)
  end

end

class Dealer < Participant

  attr_reader :name

  def initialize
    super
    @name = 'Dealer'
  end

  def deal_initial_cards(player, deck)
    2.times do 
      player.hand << deck.top_card
      hand << deck.top_card
    end
  end

  def hit_or_stick(deck)
    loop do
      hit(deck) if total_hand < 17
        
      if busted?
        break
      elsif total_hand > 17
        stick && break
      end

    end
  end

end

class Deck
  attr_accessor :remaining_cards, :card

  def initialize
    @remaining_cards = { 'Hearts': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'],
                         'Spades': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'],
                         'Diamonds': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'],
                         'Clubs': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'] }
  end

  def top_card
    @remaining_cards.reject! { |_, v| v == []}
    suit = remaining_cards.keys.sample
    value = remaining_cards[suit].sample
    @card = Card.new(suit, value)
    remove_card_from_deck(card)
    card
  end

  def remove_card_from_deck(card)
    @remaining_cards.values_at(card.suit).delete(card.value)
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
  ROUNDS = 5
  WINNING_CONDITION = 21

  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def clear
    system 'clear'
  end

  def introduction
    greeting
    get_name
    instructions
  end
  
  def greeting
    clear
    puts "Welcome to the Twenty One Game! Let's get started!"
    sleep 2
    clear
  end

  def get_name
    puts "What's your name, stranger?"
    answer = gets.chomp
    player.name = answer
    clear
    puts "Nice to meet you, #{player.name}!"
    sleep 2
    clear
  end

  def instructions
    puts <<-text
    ** ENTER 'S' TO SKIP RULES **

    The Rules:

    The objective of twenty one is to get the highest collective value of
    cards without going over the number of twenty one.

    Jack, Queen and King are equal to 10 and Ace can be either 1 or 11.

    You, and the dealer, will be dealt 2 cards at the start of the round.

    You can either 'stick' with your current total or 'hit' to add another
    card. 

    Once you 'stick' you cannot add another card. It's then the dealers
    turn to stick or hit.

    But, if your total goes over 21, you 'bust' and lose the game.

    Once both players have stuck with their hands,both sides reveal their cards. 

    The highest total is the round winner. The first to #{ROUNDS} rounds is the GRANDWINNER.

    Ready? Let's get started!
    ** ENTER 'P' to play! **
  text
  answer = gets.chomp.downcase
  clear if ['p','s'].include?(answer)
  end

  def deal_cards
    dealer.deal_initial_cards(player, deck)
  end

  def show_cards
    player.show_cards
  end

  def show_total
    player.total
  end

  def display_busted(participent)
    participent.display_busted
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

  def player_turn
    loop do
      show_cards
      show_total
      hit_or_stick_player
      break if busted?(player)
    end
    if busted?(player)
      display_busted
    else
      player.stick
    end
  end

  def dealer_turn
    loop do
      hit_or_stick_dealer
      break if busted?(dealer)
    end
  end

  def main_game
    loop do 
      deal_cards
      player_turn
      break if busted?(player)
      dealer_turn
      break if busted?(dealer)
      puts 'You got here!'
    end
  end
  
  def start
    introduction
    main_game
    show_result
  end

end

Game.new.start



# Sort out hit or stick method
