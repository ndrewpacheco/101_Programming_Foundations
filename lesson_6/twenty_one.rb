require 'pry'
CARD_VALUE = {
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "10" => 10,
  "Jack" => 10,
  "Queen" => 10,
  "King" => 10,
  "Ace" => [1, 11]
}

def deal_card(card, deck)
  suit = deck.keys.sample
  value = deck[suit].sample
  deck[suit].delete(value)
  card << value
end

def score(cards)
  score = 0
  no_aces = cards.reject { |card| card == "Ace" }
  no_aces.each { |card| score += CARD_VALUE[card] }
  cards.each do |card|
    if card == "Ace"
      score += if score <= 10
                 CARD_VALUE[card][1]
               else
                 CARD_VALUE[card][0]
               end
    end
  end
  score
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_cards(cards, name = "Dealer")
  string = ""
  cards.each_with_index do |card, i|
    string << if i == cards.size - 1
                "and #{card}."
              elsif cards.size == 2
                "#{card} "
              else
                "#{card}, "
              end
  end
  "#{name} has: #{string}"
end

def busted?(score)
  score > 21
end

prompt "Welcome to Twenty-One! Please type your name:"
name = gets.chomp.downcase.capitalize

loop do
  deck = {
    hearts: CARD_VALUE.keys,
    diamonds: CARD_VALUE.keys,
    clubs: CARD_VALUE.keys,
    spades: CARD_VALUE.keys
  }

  players_cards = []
  dealers_cards = []
  
  deal_card(players_cards, deck)
  deal_card(dealers_cards, deck)
  deal_card(players_cards, deck)
  deal_card(dealers_cards, deck)

  loop do
    players_total = score(players_cards)
    dealers_total = score(dealers_cards)
    puts "=============="
    prompt "Dealer has: #{dealers_cards[0]} and unknown card"
    prompt display_cards(players_cards, name)
    puts "=============="
    prompt "Your total: #{players_total}"
    prompt "Hit or Stay? type h for Hit or s for Stay"
    answer = gets.chomp.downcase

    puts "=============="
    if answer == "h"
      deal_card(players_cards, deck)
      prompt "You hit"
    elsif answer == "s"
      prompt "You stayed"
    else
      prompt "That was not a valid answer, try again."
    end
    break if answer == "s" || busted?(players_total)
  end
  players_total = score(players_cards)
    dealers_total = score(dealers_cards)
  if busted?(players_total)
    puts "=============="
    prompt display_cards(players_cards, name)
    prompt "Sorry you busted! Dealer wins"
    puts "=============="
  else
    while score(dealers_cards) < 17
      deal_card(dealers_cards, deck)
    end
    prompt display_cards(dealers_cards)
    prompt "Dealer's score: #{score(dealers_cards)}"
    prompt "Your score: #{score(players_cards)}"
    puts "=============="

    if score(dealers_cards) > 21
      prompt "Dealer busts. You win!"
    elsif players_total > score(dealers_cards)
      prompt "You Win!"
    elsif players_total < score(dealers_cards)
      prompt "Dealer Wins!"
    else
      prompt "It's a tie!"
    end
  end
  answer = ''
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    valid_answers = ["y", "n"]
    break if valid_answers.include?(answer)
    prompt "That was not a valid answer, try again."
  end
  break unless answer == 'y'
end
puts "=============="
prompt "Thanks for playing!"
