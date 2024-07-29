//
//  EmojiMemoryGameView.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 17.07.24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            cardView(for: card)
        }
        .foregroundStyle(.gray)
        .padding()
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card)
                .padding(4)
                .onTapGesture {
                    game.chose(card)
                }
        }
    }
}

//FIXME: - Deleted property
let game = EmojiMemoryGame()
#Preview {
// let game = EmojiMemoryGame()
    EmojiMemoryGameView(game: game)
        .preferredColorScheme(.light)
}
