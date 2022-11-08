//
//  MemoryGame.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 8/11/2022.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>;
    
    func choose (_ card: Card) {
        
    }
    
    init(noOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>();
        for pairIndex in 0..<noOfCards {
            var content: CardContent = createCardContent(pairIndex);
            cards.append(Card(content: content));
            cards.append(Card(content: content));
        }
    }
    
    
    struct Card {
        var isFaceUp: Bool = false;
        var isMatched: Bool = false;
        var content: CardContent;
    }
}
