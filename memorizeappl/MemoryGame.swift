//
//  MemoryGame.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 8/11/2022.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>;
    
    mutating func chooseCard (_ card: Card) {
        let choosenIndex = index(of: card);
//        var choosenCard = cards[choosenIndex]; this is a copy not the real array of cards
        
        cards[choosenIndex].isFaceUp.toggle();
        print("hello", card)
    }
    
    func index(of card: Card) -> Int {
        
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0;
    }
    
    init(noOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>();
        for pairIndex in 0..<noOfCards {
            let content = createCardContent(pairIndex);
            cards.append(Card(content: content, id: pairIndex * 2));
            cards.append(Card(content: content, id: pairIndex * 2 + 1));
        }
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false;
        var isMatched: Bool = false;
        var content: CardContent;
        var id: Int
    }
}
