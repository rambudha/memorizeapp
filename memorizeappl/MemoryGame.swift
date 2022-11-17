//
//  MemoryGame.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 8/11/2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { // Equatable means that the cardcontent can be comapred with =
    private(set) var cards: Array<Card>;
    
    private var indexOfChoosenCard: Int?; // not set so optional
    
    
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
                indexOfChoosenCard = nil;
            } else {
//                for index in 0..<cards.count {
                for index in cards.indices {
                    cards[index].isFaceUp = false;
                }
                indexOfChoosenCard = choosenIndex;
            }
            
            cards[choosenIndex].isFaceUp.toggle();
            
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
