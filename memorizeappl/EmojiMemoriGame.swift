//
//  EmojiMemoriGame.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 8/11/2022.
//

import SwiftUI;

//func makeCardContent(Index: Int) -> String {
//    return "⚽️";
//}

class EmojiCardGame: ObservableObject {
    
    static var emojis = ["😃", "🥹", "✈️", "🛼", "⚾️", "🏉", "🤿", "🥊", "🪀", "🧘‍♂️", "🪃", "🏊‍♀️"];
    
    //
    static func createMemoryGame() -> MemoryGame<String>  {
        MemoryGame<String>(noOfCards: 5){
            // static member don't have to mention Type to access within the static
            emojiIndex in  emojis[emojiIndex]
        };
    }

    // other class can see it but not change it
//    private(set) var model: MemoryGame<String> = MemoryGame<String>(noOfCards: 4, createCardContent: makeCardContent);
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards;
    }
    
    // mark the intent to select
    func chooseCard(_ card: MemoryGame<String>.Card) {
        model.chooseCard(card)
    }
}
