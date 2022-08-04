//
//  ContentView.swift
//  SetGame
//
//  Created by Max Kup on 27.07.2022.
//

import SwiftUI

struct SetGameView: View {
    
    @ObservedObject var game: Game
    @State var firstDealWasDone: Bool = true
    
    var body: some View {
        VStack {
            
            //Game header
            HStack {
                Button {
                    if game.currentlyShowingMatch {
                        game.replaceMatchedCards()
                    } else {
                        game.dealCards(3)
                    }
                } label: {
                    Text("Deal cards")
                }
                .disabled(!game.hasRemainingCards)
                
                Spacer()
                Text("SetGame")
                    .font(.largeTitle)
                Spacer()
                Button {
                    game.resetGame()
                    game.dealCards(initialNumberOfCards)
                } label: {
                    Text("New Game")
                }
            }
            .padding(.horizontal)
            
            //Cards
            Grid(items: game.deck) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.easeOut(duration: 1.5)) {
                            if !card.wasMatched {
                                game.chooseCard(card)
                                print(card)
                            }
                        }
                    }
                    .transition(.offset(getRandomOffscreenOffset()))
            }
            .padding()
            .onAppear {
                firstDealWasDone = true
                game.dealCards(initialNumberOfCards)
            }
            
            HStack() {
                Text("Score: \(game.score)")
                    .font(.title2)
                Spacer()
                Button {
                    game.cheatCards()
                } label: {
                    Text("Cheat")
                        .font(.title2)
                }
                .disabled(game.currentlyShowingMatch)
            }
            .padding()
            
        }
    }
    
    func getRandomOffscreenOffset() -> CGSize {
        let angle : Double = Double.random(in: 0..<(2 * Double.pi))
        return CGSize(width: offscreenRadius*cos(angle), height:offscreenRadius*sin(angle))
    }
    
    private let initialNumberOfCards = 12
    private let offscreenRadius : Double = 1000.0
}

struct SetGameView_Previews: PreviewProvider {
    
    let testGame = Game()
    
    static var previews: some View {
        SetGameView(game: Game())
//            .preferredColorScheme(.dark)
    }
}
