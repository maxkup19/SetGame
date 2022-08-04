//
//  Cardify.swift
//  SetGame
//
//  Created by Max Kup on 04.08.2022.
//

import SwiftUI

struct Cardify: Animatable, ViewModifier {
    
    var isFaceUp: Bool
    var isSelected: Bool
    var wasMatched: Bool
    var isMismatched: Bool
    var aspectRatio: CGFloat
    
    var borderColor: Color {
        if wasMatched {
            return .yellow
        } else if isSelected {
            return .blue
        }
        return .accentColor
    }
    
    var cardColor: Color {
        if wasMatched {
            return .green
        } else if isMismatched {
            return .red
        }
        return .white
    }
    
    func body(content: Self.Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(cardColor)
                    .opacity(isMismatched || wasMatched ? 0.2 : 1.0)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: isSelected ? 5 : edgeLineWidth)
                    .foregroundColor(borderColor)
                        content
            }
            .opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.orange)
                .opacity(isFaceUp ? 0 : 1)
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 1
    
}


