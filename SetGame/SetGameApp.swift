//
//  SetGameApp.swift
//  SetGame
//
//  Created by Max Kup on 27.07.2022.
//

import SwiftUI

@main
struct SetGameApp: App {
    
    var body: some Scene {
        WindowGroup {
            SetGameView(game: Game())
        }
    }
}
