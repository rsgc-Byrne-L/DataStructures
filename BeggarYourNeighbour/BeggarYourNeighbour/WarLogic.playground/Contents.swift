//: Playground - noun: a place where people can play

import Cocoa

// Create an enumeration for the suits of a deck of cards
enum Suit : String {
    
    case hearts     = "❤️"
    case diamonds   = "♦️"
    case spades     = "♠️"
    case clubs      = "♣️"
    
    // Given a value, returns the suit
    static func glyph(forHashValue : Int) -> String {
        switch forHashValue {
        case 0 :
            return Suit.hearts.rawValue
        case 1 :
            return Suit.diamonds.rawValue
        case 2 :
            return Suit.spades.rawValue
        case 3 :
            return Suit.clubs.rawValue
        default:
            return Suit.hearts.rawValue
        }
    }
    
}

// Play with the enumeration a bit to see what it gives us
Suit.hearts.hashValue
Suit.hearts.rawValue

// Create a new datatype to represent a playing card
struct Card {
    
    var value : Int
    var suit : Int
    
    // Initializer accepts arguments to set up this instance of the struct
    init(value : Int, suit : Int) {
        self.value = value
        self.suit = suit
    }
    
}

// Initalize a deck of cards
var deck : [Card] = []
for suit in 0...3 {
    for value in 2...14 {
        var card = Card(value: value, suit: suit)
        deck.append(card)
    }
}

// Iterate over the deck of cards
for card in deck {
    print("Suit is \(Suit.glyph(forHashValue: card.suit)) and value is \(card.value)")
}

// Declare count
 var count = 0

 var current = 0

// Initialize hands
var playerHand : [Card] = []
var computerHand : [Card] = []

// "Shuffle" the deck and give half of the cards to the player
while deck.count > 26 {
    
    // Generate a random number between 0 and the count of cards still left in the deck
    var position = Int(arc4random_uniform(UInt32(deck.count)))
    
    // Copy the card in this position to the player's hand
    playerHand.append(deck[position])
    
    // Remove the card from the deck for this position
    deck.remove(at: position)
}

// Give the other half of the cards to the player
while deck.count > 0 {
    computerHand.append(deck[0])
    deck.removeFirst()
}

// Iterate over the player's hand
print("=====================================")
print("All cards in the player's hand are...")
for (value, card) in playerHand.enumerated() {
    print("Card \(value) in player's hand is a suit of \(Suit.glyph(forHashValue: card.suit)) and value is \(card.value)")
}
print("=====================================")
print("All cards in the comptuers's hand are...")
for (value, card) in computerHand.enumerated() {
    print("Card \(value) in computer's hand is a suit of \(Suit.glyph(forHashValue: card.suit)) and value is \(card.value)")
}

// Keep playing until a player runs out of cards
while playerHand.count > 0 && computerHand.count > 0 {

    // Determine who wins this round
    if playerHand[0].value > computerHand[0].value {
        // Case for player winning
        playerHand.append(playerHand[0])
        playerHand.append(computerHand[0])
        computerHand.remove(at: 0)
        playerHand.remove(at: 0)
    
    } else if computerHand[0].value > playerHand[0].value {
        // Case for computer winning
        computerHand.append(computerHand[0])
        computerHand.append(playerHand[0])
        playerHand.remove(at: 0)
        computerHand.remove(at: 0)
    
    } else {
        // Case for tie
        playerHand.append(playerHand[0])
        playerHand.append(computerHand[0])
        playerHand.remove(at: 0)
        computerHand.remove(at: 0)
    }
    
    
    /*
    for count in 0...current {
        
        if playerHand.count > computerHand.count {
            current = computerHand.count
        } else if computerHand.count > playerHand.count {
            current = playerHand.count
        } else {
            current = playerHand.count
        }

    // Case for player winning
    if playerHand[count].value > computerHand[count].value {
        playerHand.append(playerHand[count])
        playerHand.append(computerHand[count])
        computerHand.remove(at: count)
        
        count
        playerHand
        computerHand
        
    // Case for computer winning
    } else if computerHand[count].value > playerHand[count].value {
        computerHand.append(computerHand[count])
        computerHand.append(playerHand[count])
        playerHand.remove(at: count)
    // Case for tie
    } else {
        computerHand.append(computerHand[count])
        computerHand.append(playerHand[count])
        playerHand.remove(at: 0)
    }

}
 */
}

if computerHand.count == 0 {
    print("Player wins!")
} else if playerHand.count == 0 {
    print("Computer wins!")
} else {
    print("Error")
}
