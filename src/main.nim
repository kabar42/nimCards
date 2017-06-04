include hand

let deck = generateDeck()
# for c in deck:
#   echo $c

var startHand = newHand()
var allHands = newSeq[HandRef]()

generateAllHands(deck[0..^1], startHand, allHands)

echo "Hand count: ", allHands.len
