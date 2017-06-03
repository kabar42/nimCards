const
  hand_size = 5

type
  Rank* = enum
    Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King

  Suit* = enum
    Hearts, Clubs, Diamonds, Spades

  Card* = tuple[rank: Rank, suit: Suit]

type
  Hand* = object
    cards*: seq[Card]

proc newHand*(): Hand = Hand(cards: @[])

method isFull*(h: Hand): bool {.inline.} = h.cards.len >= hand_size

method add*(h: var Hand, c: Card) {.inline.} =
  if not h.isFull:
    h.cards.add(c)

