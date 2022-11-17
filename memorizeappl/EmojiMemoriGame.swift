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
    
    typealias Card = MemoryGame<String>.Card;
    
    private static var emojis = ["😃", "🥹", "✈️", "🛼", "⚾️", "🏉", "🤿", "🥊", "🪀", "🧘‍♂️", "🪃", "🏊‍♀️"];
    
    //
    private static func createMemoryGame() -> MemoryGame<String>  {
        MemoryGame<String>(noOfCards: 5){
            // static member don't have to mention Type to access within the static
            emojiIndex in  emojis[emojiIndex]
        };
    }

    // other class can see it but not change it
//    private(set) var model: MemoryGame<String> = MemoryGame<String>(noOfCards: 4, createCardContent: makeCardContent);
    @Published private var model = createMemoryGame()
    // publish will make changes to ui if any data on it changes
    
    var cards: Array<Card> {
        return model.cards;
    }
    
    // mark the intent to select
    func chooseCard(_ card: Card) {
        model.chooseCard(card)
    }
}
