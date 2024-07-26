//
//  CardGameApp.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 17.07.24.
//

import SwiftUI

@main
struct CardGameApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
