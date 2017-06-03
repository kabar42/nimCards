const
  hand_size = 5
  deck_size = 52

type
  Rank* = enum
    Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King

  Suit* = enum
    Hearts, Clubs, Diamonds, Spades

  Card* = tuple[rank: Rank, suit: Suit]

proc generateDeck*(): array[deck_size, Card] =
  var cards: array[deck_size, Card]
  var index = 0
  for s in Suit:
    for r in Rank:
      cards[index] = (rank: r, suit: s)
      index = index + 1
  result = cards

type
  Hand* = object
    cards*: seq[Card]

proc newHand*(): Hand =
  var h: Hand = Hand(cards: @[])
  result = h

proc copyHand*(h: Hand): Hand =
  var cardCopy = newSeq[Card]()
  for c in h.cards:
    cardCopy.add(c)
  var h: Hand = Hand(cards: cardCopy)
  result = h

method isFull*(h: Hand): bool {.inline.} = h.cards.len >= hand_size

method add*(h: var Hand, c: Card) {.inline.} =
  if not h.isFull:
    h.cards.add(c)

method print*(h: Hand) =
  var output: string = "Hand: ["
  for i, c in h.cards:
    output = output & $c.rank & " of " & $c.suit
    if i != h.cards.len-1:
      output = output & ", "
  output = output & "]\n"
  echo output


proc generateAllHands(deck: seq[Card], hand: Hand, all_hands: var seq[Hand]) =
  if hand.isFull():
    all_hands.add(hand)
  elif deck.len > 0:
    var new_hand = copyHand(hand)
    new_hand.add(deck[0])
    let deck_slice = deck[1..^1]
    generateAllHands(deck_slice, new_hand, all_hands)
    generateAllHands(deck_slice, hand, all_hands)
