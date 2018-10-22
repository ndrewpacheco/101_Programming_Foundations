CARD_VALUE = {
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5"=> 5,
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

deck = { 
  hearts: CARD_VALUE.keys,
  diamonds: CARD_VALUE.keys,
  clubs: CARD_VALUE.keys,
  spades: CARD_VALUE.keys
}

players_cards = []
dealers_cards = []

def deal_card(card, deck)
  suit = deck.keys.sample
  value = deck[suit].sample
  deck[suit].delete(value)
  card << value
end

def score(cards)
  score = 0
  cards.each { |card| score += CARD_VALUE[card] }
  score
end

def prompt(msg)
  puts "=> #{msg}"
end

deal_card(players_cards, deck)
deal_card(dealers_cards, deck)
deal_card(players_cards, deck)
deal_card(dealers_cards, deck)

prompt "Dealer has: #{dealers_cards[0]} and unknown card"
prompt "You have #{players_cards[0]} and #{players_cards[1]} "
prompt "Your total: #{score(players_cards)}"
prompt "Hit or Stay? type h or s"
gets.chomp
