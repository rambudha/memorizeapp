//
//  MemoryGame.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 8/11/2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { // Equatable means that the cardcontent can be comapred with =
    private(set) var cards: Array<Card>;
    
    // computed property
    private var indexOfChoosenCard: Int? {
        get { cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly } // as a extension of an arra
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    
    mutating func chooseCard (_ card: Card) {
//        if let choosenIndex = cards.firstIndex(where: { indexedCard in indexedCard.id ==  card.id }){
        if let choosenIndex = cards.firstIndex(where: { $0.id ==  card.id }),
           !cards[choosenIndex].isFaceUp,
           !cards[choosenIndex].isMatched
        {
            
            if let potentialMatchIndex = indexOfChoosenCard {
                if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                    cards[choosenIndex].isMatched = true;
                    cards[potentialMatchIndex].isMatched = true;
                }
                cards[choosenIndex].isFaceUp = true;
            } else {
                indexOfChoosenCard = choosenIndex;
            }
        }
//        var choosenCard = cards[choosenIndex]; this is a copy not the real array of cards

    }
    
    init(noOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [];
        for pairIndex in 0..<noOfCards {
            let content = createCardContent(pairIndex);
            cards.append(Card(content: content, id: pairIndex * 2));
            cards.append(Card(content: content, id: pairIndex * 2 + 1));
        }
    }
    
    
    struct Card: Identifiable {
        var isFaceUp = false;
        var isMatched = false;
        let content: CardContent;
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first;
        } else {
            return nil;
        }
    }
}
