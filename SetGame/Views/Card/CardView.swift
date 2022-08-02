//
//  CardView.swift
//  SetGame
//
//  Created by Max Kup on 30.07.2022.
//

import SwiftUI

struct CardView: View {
    
    var card: SetGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            cardBody(for: geometry.size)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        .overlay(RoundedRectangle(cornerRadius: 20).stroke())
        .padding()
        
    }
    
    @ViewBuilder
    private func cardBody(for size: CGSize) -> some View {
        VStack {
            ForEach(0..<card.number, id: \.self) { _ in SymbolView(card: card) }
                .frame(width: min(size.width, size.height*cardAspectRatio) * shapeWidthScale, height: min(size.height,size.width / cardAspectRatio) / shapeHeightScale)
        }
        .padding(3)
        
    }
    
    
    private let cardAspectRatio  : CGFloat = 2/3
    private let shapeWidthScale : CGFloat = 0.5
    private let shapeHeightScale : CGFloat = 6
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetGame.Card(id: 1, number: 2, color: .green, symbol: .diamond, shading: .stripped))
    }
}
