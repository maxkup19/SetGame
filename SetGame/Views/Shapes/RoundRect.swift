//
//  RoundREct.swift
//  SetGame
//
//  Created by Max Kup on 28.07.2022.
//

import SwiftUI

struct Oval: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
    }
}

struct RoundRect_Previews: PreviewProvider {
    static var previews: some View {
        Oval()
            .foregroundStyle(LinearGradient(colors: [.yellow, .blue], startPoint: .bottomTrailing, endPoint: .topLeading))
        
        VStack {
            Oval()
            Oval()
            Oval()
        }
    }
    
}
