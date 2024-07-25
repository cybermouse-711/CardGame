//
//  ContentView.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 17.07.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.chose(card)
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
    ContentView(viewModel: game)
        .preferredColorScheme(.light)
}
