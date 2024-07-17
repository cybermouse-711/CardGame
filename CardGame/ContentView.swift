//
//  ContentView.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 17.07.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke()
            Text("Hello, world!")
        }
        .foregroundStyle(Color.red)
        .padding()
    }
}

#Preview {
    ContentView()
}
