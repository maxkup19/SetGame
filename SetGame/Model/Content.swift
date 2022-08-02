//
//  Content.swift
//  SetGame
//
//  Created by Max Kup on 27.07.2022.
//

import Foundation

struct Content {
    enum Color: CaseIterable {
        case red
        case blue
        case green
    }
    
    enum Symbol: CaseIterable {
        case oval
        case squiggle
        case diamond
    }
    
    enum Shading: CaseIterable {
        case solid
        case open
        case stripped
    }
}
