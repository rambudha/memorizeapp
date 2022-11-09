//
//  ContentView.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 4/11/2022.
//

import SwiftUI

struct ContentView: View {
    
//    var emojis = ["😃", "🥹", "✈️", "🛼", "⚾️", "🏉", "🤿", "🥊", "🪀", "🧘‍♂️"];
    
    @State var emojiCounter = 4;
    
//    var viewModel = EmojiCardGame();
    @ObservedObject var viewModel: EmojiCardGame;
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                }
            }
//            .padding(10)
            .font(.largeTitle)
            .foregroundColor(.red);
        }
//        .padding(.horizontal)
    }
    
    
}


struct CardView: View {
    var card: MemoryGame<String>.Card;
    @State private var isTouched = true;
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if(card.isFaceUp) {
                shape.fill().foregroundColor(.white)
//                shape.strokeBorder(lineWidth: 3)
//                shape.frame(width: 20, height: 20)
                Text(card.content).font(.largeTitle)
                
            } else {
                shape.fill();
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiCardGame();
        ContentView(viewModel: game)
    }
}

struct ContentView_Previews_Dark: PreviewProvider {
    static var previews: some View {
        let game = EmojiCardGame();
        ContentView(viewModel: game).preferredColorScheme(.dark)
    }
}
