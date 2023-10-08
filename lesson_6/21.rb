require 'pry'

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
RANKS = ['Ace', 'Two', 'Three', 'Four', 'Five'] +
        ['Six', 'Seven', 'Eight', 'Nine', 'Ten'] +
        ['Jack', 'King', 'Queen']

def prompt(msg)
  puts "=> #{msg}"
end

def create_deck
  RANKS.each_with_object([]) do |rank, deck|
    SUITS.each do |suit|
      deck.push([rank, suit])
    end
  end
end

def card_values
  ordered_deck = create_deck
  values_hash = {}
    ordered_deck.each_with_index do |card, index|
      case index
      when (0..3) then values_hash.store(card, 1)
      when (4..7) then values_hash.store(card, 2)
      when (8..11) then values_hash.store(card, 3)
      when (12..15) then values_hash.store(card, 4)
      when (16..19) then values_hash.store(card, 5)
      when (20..23) then values_hash.store(card, 6)
      when (24..27) then values_hash.store(card, 7)
      when (28..31) then values_hash.store(card, 8)
      when (32..35) then values_hash.store(card, 9)
      when (36..52) then values_hash.store(card, 10)
      end
    end
  values_hash
end

def card_name(card)
  card.join(' of ')
end

def draw_cards!(deck, hand, qty)
  qty.times { hand.push(deck.shift) }
end

def joinor(arr, delimiter=', ', word='&')
  case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def convert_hand(hand)
  hand.map do |card|
    card_name(card)
  end
end

def announce_player_hand(hand)
  prompt("Your hand is #{joinor(convert_hand(hand), ', ','&')}. (#{total_value(hand)})")
end

def announce_dealer_hand(hand, show=0)
  case show
  when 0 then prompt("Dealer hand is #{convert_hand(hand)[0]} and unknown card.")
  else prompt("Dealer hand is #{joinor(convert_hand(hand), ', ','&')}. (#{total_value(hand)})")
  end
end

def busted?(hand)
  total_value(hand) > 21 ? true : false
end

def total_value(hand)
  values_hash = card_values
  hand_value = hand.map do |card|
    values_hash[card]
  end

  sum = hand_value.sum
  hand_value.count(1).times do
    sum += 10 if sum <= 11
  end
  sum
end


deck = create_deck
deck.shuffle!
player_hand = []
dealer_hand = []

draw_cards!(deck, player_hand, 2)
draw_cards!(deck, dealer_hand, 2)

loop do
  break if busted?(player_hand)
  announce_player_hand(player_hand)
  announce_dealer_hand(dealer_hand)

  prompt("Would you like to hit or stay?")
  answer = gets.chomp.to_s.downcase
  break if answer.start_with?('s')
  draw_cards!(deck, player_hand, 1)
end

announce_player_hand(player_hand)
announce_dealer_hand(dealer_hand, 1)

if busted?(player_hand)
  prompt("You're busted!")
else
  prompt ("You chose to stay")
end
