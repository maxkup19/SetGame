//
//  CardView.swift
//  SetGame
//
//  Created by Max Kup on 27.07.2022.
//

import SwiftUI

struct SymbolView: View {
    typealias Symbol = Content.Symbol
    typealias Shading = Content.Shading
    
    let colors = [Content.Color.red: Color.red, Content.Color.blue: Color.blue, Content.Color.green: Color.green]
    
    let card: SetGame.Card
    
    var body: some View {
        createSymbolFromCard(card)
            .foregroundColor(colors[card.color]!)
    }
    
    @ViewBuilder
    private func createSymbolFromCard(_ card: SetGame.Card) -> some View {
        if self.card.symbol == Symbol.oval {
            if self.card.shading == Shading.solid {
                RoundedRectangle(cornerRadius: ovalCornerRadius)
                    .fill()
            } else if self.card.shading == Shading.stripped {
                ZStack {
                    Stripes()
                        .stroke(lineWidth: stripeWidth)
                        .mask(RoundedRectangle(cornerRadius: ovalCornerRadius))
                    RoundedRectangle(cornerRadius: ovalCornerRadius)
                        .stroke()
                }
            } else {
                RoundedRectangle(cornerRadius: ovalCornerRadius)
                    .stroke(lineWidth: stripeWidth)
            }
        } else if self.card.symbol == Symbol.diamond{
            if self.card.shading == Shading.solid {
                Diamond().fill()
            } else if self.card.shading == Shading.stripped {
                ZStack {
                    Stripes()
                        .stroke(lineWidth: stripeWidth)
                        .mask(Diamond())
                    Diamond()
                        .stroke()
                }
            } else {
               Diamond()
                    .stroke()
            }
        } else {
            if self.card.shading == Shading.solid {
               Squiggle()
                    .fill()
            } else if self.card.shading == Shading.stripped {
                ZStack {
                    Stripes()
                        .stroke(lineWidth: stripeWidth)
                        .mask(Squiggle())
                    Squiggle()
                        .stroke()
                }
            } else {
               Diamond()
                    .stroke()
            }
        }
    }
    
    private let stripeWidth: CGFloat = 1
    private let ovalCornerRadius: CGFloat = 50
        
}

struct SymbolView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack {
            SymbolView(card: SetGame.Card(id: 1, number: 2, color: .green, symbol: .diamond, shading: .stripped))
            
            SymbolView(card: SetGame.Card(id: 1, number: 2, color: .red, symbol: .squiggle, shading: .solid))
            
            SymbolView(card: SetGame.Card(id: 1, number: 2, color: .blue, symbol: .oval, shading: .open))
        }
        .frame(width: 300, height: 300)
    }
}
