//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 23.07.24.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🐼", "🐻", "🐻‍❄️", "🐨", "🐶", "🐹", "🐭", "🐰", "🐱"]
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
}
