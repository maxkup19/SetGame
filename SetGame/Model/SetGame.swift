//
//  Game.swift
//  SetGame
//
//  Created by Max Kup on 27.07.2022.
//

import Foundation

struct SetGame {
    private(set) var deck: [Card]
    private var cardIndex: Int = 0
    var score: Int = 0
    
    var hasRemainingCards: Bool {
        cardIndex < deck.count
    }
    
    var selectedCards: [Card] { deck.filter { $0.isSelected } }
    
    init() {
        deck = []
        for number in 1...3 {
            for symbol in Content.Symbol.allCases {
                for color in Content.Color.allCases {
                    for shading in Content.Shading.allCases {
                        deck.append(Card(id: deck.endIndex, number: number, color: color, symbol: symbol, shading: shading))
                    }
                }
            }
        }
        deck.shuffle()
    }
    
    //game logic
    
    func cardsMakeASet(selected: Array<Card>) -> Bool {
        if(selected.count != 3){
            return false
        }
        
        let numbersAllMatch : Bool  = (selected[0].number == selected[1].number && selected[1].number == selected[2].number)
        let numbersAllDiffer : Bool = (selected[0].number != selected[1].number && selected[1].number != selected[2].number && selected[0].number != selected[2].number)
        
        let colorsAllMatch : Bool  = (selected[0].color == selected[1].color && selected[1].color == selected[2].color)
        let colorsAllDiffer : Bool = (selected[0].color != selected[1].color && selected[1].color != selected[2].color && selected[0].color != selected[2].color)
        
        let symbolsAllMatch : Bool  = (selected[0].symbol == selected[1].symbol && selected[1].symbol == selected[2].symbol)
        let symbolsAllDiffer : Bool = (selected[0].symbol != selected[1].symbol && selected[1].symbol != selected[2].symbol && selected[0].symbol != selected[2].symbol)
        
        let shadingsAllMatch : Bool  = (selected[0].shading == selected[1].shading && selected[1].shading == selected[2].shading)
        let shadingsAllDiffer : Bool = (selected[0].shading != selected[1].shading && selected[1].shading != selected[2].shading && selected[0].shading != selected[2].shading)
        
        return (numbersAllMatch || numbersAllDiffer) && (colorsAllMatch || colorsAllDiffer) && (symbolsAllMatch || symbolsAllDiffer) && (shadingsAllMatch || shadingsAllDiffer)
    }
    
    mutating func deselectAll() {
        selectedCards.forEach { card in
            if let matchingIndex = deck.firstIndex(matching: card) {
                deck[matchingIndex].isSelected = false
                deck[matchingIndex].isMismatched = false
            }
        }
    }
    
    mutating func choose(_ card: Card){
        if selectedCards.count < 3 {
            if let chosenIndex = deck.firstIndex(matching: card){
                
                deck[chosenIndex].isSelected = !deck[chosenIndex].isSelected
                
                if selectedCards.count == 3 {
                    if cardsMakeASet(selected: selectedCards) {
                        selectedCards.forEach { card in
                            if let index = deck.firstIndex(matching: card) {
                                deck[index].wasMatched = true
                            }
                        }
                        self.score += 1
                    } else {
                        selectedCards.forEach { card in
                            if let index = deck.firstIndex(matching: card) {
                                deck[index].isMismatched = true
                            }
                        }
                    }
                }
            }
        } else {
            if hasRemainingCards {
                replaceMatchedCards()
            } else {
                deck.filter{ card in
                    card.isSelected && card.wasMatched
                }.forEach{ card in
                    if let index = deck.firstIndex(matching: card) {
                        deck[index].wasDiscarded = true
                    }
                }
            }
            deselectAll()
            if let chosenIndex = deck.firstIndex(matching: card) {
                deck[chosenIndex].isSelected = true
            }
        }
        
    }
    
    mutating func replaceMatchedCards() {
        selectedCards.forEach { card in
            if card.wasMatched {
                if let index = deck.firstIndex(matching: card) {
                    deck[index].wasDiscarded = true
                    if hasRemainingCards {
                        deck[cardIndex].wasDealt = true
                        cardIndex += 1
                    }
                }
            }
        }
    }
    
    mutating func dealCards(_ number: Int) {
        for _ in 0..<number {
            if hasRemainingCards {
                deck[cardIndex].wasDealt = true
                cardIndex += 1
            }
        }
    }
    
    struct Card: Identifiable{
        var wasDealt: Bool      = false
        var isSelected : Bool   = false
        var wasMatched: Bool    = false
        var isMismatched: Bool  = false
        var wasDiscarded : Bool = false
        
        var id: Int
        
        // card content
        var number: Int
        let color: Content.Color
        let symbol: Content.Symbol
        let shading: Content.Shading
    }
}
