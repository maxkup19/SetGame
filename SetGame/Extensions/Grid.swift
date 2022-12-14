//
//  Grid.swift
//  SetGame
//
//  Created by Max Kup on 31.07.2022.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    private var items : [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(items: [Item], viewForItem: @escaping (Item)->ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View{
        return ForEach(items){ item in
            self.body(for: item, in: layout)
        }
    }
    private func body(for item: Item, in layout: GridLayout) -> some View{
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))

    }
    
}
