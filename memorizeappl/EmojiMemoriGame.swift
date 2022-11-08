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

class EmojiCardGame {
    // other class can see it but not change it
//    private(set) var model: MemoryGame<String> = MemoryGame<String>(noOfCards: 4, createCardContent: makeCardContent);
    private(set) var model: MemoryGame<String> = MemoryGame<String>(noOfCards: 4){ _ in  "⚽️"};
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards;
    }
}
