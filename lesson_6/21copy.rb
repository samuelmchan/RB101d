require 'pry'

CARDTYPES = {
  suits: ['Hearts', 'Diamonds', 'Clubs', 'Spades'],
  ranks: ['Ace', 'Two', 'Three', 'Four'] +
         ['Five', 'Six', 'Seven', 'Eight'] +
         ['Nine', 'Ten', 'Jack', 'Queen', 'King']
}

def prompt(msg)
  puts "=> #{msg}"
end

def create_deck # returns array for 52ct playing card deck
  CARDTYPES[:ranks].each_with_object([]) do |rank, deck|
    CARDTYPES[:suits].each do |suit|
      deck.push([rank, suit])
    end
  end
end

def card_values # returns hash with value for each card in deck
  ordered_deck = create_deck
  values_hash = {}
    ordered_deck.each_with_index do |card, index|
      case index
      when (36..52) then values_hash.store(card, 10)
      else
        values_hash.store(card, (index/4)+1)
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
  hand_value.count(1).times do # adjust for variable Ace value
    sum += 10 if sum <= 11
  end
  sum
end

def dealer_turn(deck, hand)
  until total_value(hand) >= 17
    draw_cards!(deck, hand, 1)
    prompt("The dealer has drawn an extra card")
    announce_dealer_hand(hand, 1)
  end

  if busted?(hand)
    prompt("The dealer has busted, you win!")
  else
    prompt ("The dealer has chosen to stay")
  end
end

def win?(winner_hand, loser_hand)
  total_value(winner_hand) < total_value(loser_hand)
end

deck = create_deck
deck.shuffle!
player_hand = []
dealer_hand = []

draw_cards!(deck, player_hand, 2)
draw_cards!(deck, dealer_hand, 2)

loop do
  system 'clear'
  break if busted?(player_hand)
  announce_player_hand(player_hand)
  announce_dealer_hand(dealer_hand)

  prompt("Would you like to hit or stay?")
  answer = gets.chomp.to_s.downcase
  break if answer.start_with?('s')
  draw_cards!(deck, player_hand, 1)
end

system 'clear'
announce_player_hand(player_hand)
announce_dealer_hand(dealer_hand, 1)

if busted?(player_hand)
  prompt("You're busted!, Game Over")
else
  prompt ("You choose to stay")
  dealer_turn(deck, dealer_hand)
end
