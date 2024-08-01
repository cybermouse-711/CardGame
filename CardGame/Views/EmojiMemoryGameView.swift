//
//  EmojiMemoryGameView.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 17.07.24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    @State private var dealt = Set<Int>()
    @Namespace private var dealingNamespace
    
    var body: some View {
        ZStack {
            VStack {
                gameBody
                HStack {
                    restart
                    Spacer()
                    shuffle
                }.padding(.horizontal)
            }
            deckBody
        }
        .padding()
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: CardConstants.aspectRatio) { card in
            cardView(for: card)
        }
        .foregroundStyle(CardConstants.color)
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(CardConstants.color)
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
        .font(.title2)
        .foregroundColor(CardConstants.color)
    }
    
    var restart: some View {
        Button("Restart") {
            withAnimation {
                dealt = []
                game.restart()
            }
        }
        .font(.title2)
        .foregroundColor(CardConstants.color)
    }
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (CardConstants.totalDealDuration / Double(game.cards.count))
        }
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
            Color.clear
        } else {
            CardView(card)
                .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                .padding(4)
                .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                .zIndex(zIndex(of: card))
                .onTapGesture {
                    withAnimation {
                        game.chose(card)
                    }
                }
        }
    }
    
    private struct CardConstants {
        static let color = Color.gray
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration = 0.5
        static let totalDealDuration = 1.5
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * aspectRatio
    }
}

//FIXME: - Deleted property
let game = EmojiMemoryGame()
#Preview {
// let game = EmojiMemoryGame()
    EmojiMemoryGameView(game: game)
        .preferredColorScheme(.light)
}
