//
//  ContentView.swift
//  CardGame
//
//  Created by Elizaveta Medvedeva on 17.07.24.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🐼", "🐻", "🐻‍❄️", "🐨", "🐶", "🐹", "🐭", "🐰", "🐱"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundStyle(.gray)
            
            Spacer()
            HStack {
                Button{
                    if emojiCount > 1 {
                        emojiCount -= 1
                    }
                }
            label: { Image(systemName: "minus.circle") }
                
                Spacer()
                Text("Change").foregroundStyle(.gray)
                Spacer()
                
                Button {
                    if emojiCount < emojis.count {
                        emojiCount += 1
                    }
                }
            label: { Image(systemName: "plus.circle") }
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
