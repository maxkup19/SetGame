//
//  Stripes.swift
//  SetGame
//
//  Created by Max Kup on 28.07.2022.
//

import SwiftUI

struct Stripes: Shape {
    //distance between lines
    var width : Int = 3
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let count = Int(rect.maxX / CGFloat(width))
        for index in 0 ... count {
            let x       = index*(width * 4)
            let start   = CGPoint(x: x,y: 0)
            let end     = CGPoint(x: CGFloat(x),y: rect.maxY)
            
            path.move(to: start)
            path.addLine(to: end)
        }
        return path
    }
}

struct Stripes_Previews: PreviewProvider {
    static var previews: some View {
        Stripes().stroke(lineWidth: CGFloat(1))
            .preferredColorScheme(.dark)
    }
}
