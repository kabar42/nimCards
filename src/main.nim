include hand

let aCard: Card = (rank: Ace, suit: Spades)

echo "Card: ", aCard.rank, aCard.suit

var h: Hand = newHand()
h.add((rank: King, suit: Spades))
h.add((rank: Queen, suit: Spades))
h.add((rank: Jack, suit: Spades))
h.add((rank: Ten, suit: Spades))
h.add((rank: Ace, suit: Spades))

var output: string = "Hand: ["
for c in h.cards:
  output = output & $c.rank & " of " & $c.suit
  if c != h.cards[high(h.cards)]:
    output = output & ", "
output = output & "]\n"

echo output
