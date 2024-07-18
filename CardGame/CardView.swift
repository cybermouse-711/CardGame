//
//  CardView.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 18.07.24.
//

import SwiftUI

struct CardView: View {
    var content: String
    
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundStyle(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    CardView(content: "🐼")
}
