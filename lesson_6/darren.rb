DECK =  [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A']] +
        [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']] +
        [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A']] +
        [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A']]

SUIT_KEY = {'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades'}
RANK_KEY = {'A' => 'Ace', '1' => 'One', '2' => 'Two', '3' => 'Three', '4' => 'Four',
            '5' => 'Five', '6' => 'Six', '7' => 'Seven', '8' => 'Eight', '9' => 'Nine',
            '10' => 'Ten', 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King'}

def joinor(arr, delimiter=', ', word='or')
  case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def card_name(card)
  RANK_KEY[card[1]] + ' of ' + SUIT_KEY[card[0]]
end

def translate_hand(hand)
  hand.map do |card|
    card_name(card)
  end
end

def announce_hand(hand)
  puts "Your hand is #{joinor(translate_hand(hand), ', ','&')}"
end

p card_name(['S' , '2'])
p card_name(['H' , 'Q'])

p translate_hand([['S' , 'A'], ['D', 'Q'], ['C', '3']])
announce_hand([['S' , 'A'], ['D', 'Q'], ['C', '3']])
