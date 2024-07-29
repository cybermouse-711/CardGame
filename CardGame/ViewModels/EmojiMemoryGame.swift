//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 23.07.24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published private var model = createMemoryGame()
    
    private static let emojis = ["🐼", "🐻", "🐻‍❄️", "🐨", "🐶", "🐹", "🐭", "🐰", "🐱", "🐯", "🦁", "🐷", "🐮", "🦊", "🐣", "🐥"]
    
    var cards: Array<Card> {
        model.cards
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsCards: 12) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    func chose(_ card: Card) {
        model.choose(card)
    }
}
