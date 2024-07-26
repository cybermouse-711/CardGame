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
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(game.cards) { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.chose(card)
                        }
                }
            }
        }
        .foregroundStyle(.gray)
        .padding()
    }
}

//FIXME: - Deleted property
let game = EmojiMemoryGame()
#Preview {
// let game = EmojiMemoryGame()
    EmojiMemoryGameView(game: game)
        .preferredColorScheme(.light)
}
