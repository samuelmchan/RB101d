require 'pry'

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
RANKS = ['Ace', 'Two', 'Three', 'Four', 'Five'] +
        ['Six', 'Seven', 'Eight', 'Nine', 'Ten'] +
        ['Jack', 'King', 'Queen']

CARDTYPES = {
  suits: ['Hearts', 'Diamonds', 'Clubs', 'Spades'],
  ranks: ['Ace', 'Two', 'Three', 'Four'] +
         ['Five', 'Six', 'Seven', 'Eight'] +
         ['Nine', 'Ten', 'Jack', 'Queen', 'King']
}

p CARDTYPES
