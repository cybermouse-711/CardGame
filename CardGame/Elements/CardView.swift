//
//  CardView.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 18.07.24.
//

import SwiftUI

struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill().foregroundStyle(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}
