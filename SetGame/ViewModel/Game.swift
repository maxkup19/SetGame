//
//  Game.swift
//  SetGame
//
//  Created by Max Kup on 27.07.2022.
//

import SwiftUI

class Game: ObservableObject {
    typealias Card = SetGame.Card
    
    @Published private var game: SetGame = createGame()
    private(set) var numberOfCardsShown: Int = 12
    
    private static func createGame() -> SetGame { SetGame() }

    var deck: [Card] { game.deck.filter { $0.wasDealt && !$0.wasDiscarded } }
    var score: Int { game.score }
    var hasRemainingCards: Bool { game.hasRemainingCards }
    var currentlyShowingMatch: Bool { deck.filter { $0.wasMatched }.count == 3 }
    
    
    // MARK: - Intent(s)
    
    
    func resetGame() { game = Game.createGame() }
    
    func replaceMatchedCards() { game.replaceMatchedCards() }
    
    func chooseCard(_ card: Card) { game.choose(card) }
    
    func dealCards(_ number: Int) { game.dealCards(number) }
    
    func cheatCards() {
        if let matchingTriple = deck.firstMatchingTriple(matchBy: { selected in // (_ slected) 
            game.cardsMakeASet(selected: selected)
        }) {
            game.deselectAll()
            chooseCard(matchingTriple[0])
            chooseCard(matchingTriple[1])
        }
    }
    
}
