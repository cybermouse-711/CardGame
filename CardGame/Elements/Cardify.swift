//
//  Cardify.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 30.07.24.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    
    var animetableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
    
            if rotation < 90 {
                shape.fill().foregroundStyle(.white)
                shape.stroke(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 15
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
