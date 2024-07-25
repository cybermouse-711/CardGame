//
//  CardView.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 18.07.24.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill().foregroundStyle(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

//#Preview {
//    let card = MemoryGame<String>.Card()
//    CardView(card: card)
//}
