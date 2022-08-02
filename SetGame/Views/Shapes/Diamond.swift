//
//  Diamond.swift
//  SetGame
//
//  Created by Max Kup on 28.07.2022.
//

import SwiftUI

struct Diamond : Shape {
    
    func path(in rect: CGRect)-> Path{
        let left    = CGPoint(x:  rect.minX, y: rect.midY)
        let top     = CGPoint(x:  rect.midX, y: rect.minX)
        let right   = CGPoint(x:  rect.maxX, y: rect.midY)
        let bottom  = CGPoint(x:  rect.midX, y: rect.maxY)
        
        var p = Path()
        p.move(to: left)
        p.addLine(to: top)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.addLine(to: left)
        
        return p
    }
    
}

struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Diamond()
            Diamond()
            Diamond()
        }
        .frame(width: 200, height: 300)
    }
}
