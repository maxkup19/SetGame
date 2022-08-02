//
//  Extensions.swift
//  SetGame
//
//  Created by Max Kup on 28.07.2022.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0...self.count {
            if self[index].id == matching.id  { return index }
        }
        return nil
    }
    
    func firstMatchingTriple(matchBy: (Array<Element>) -> Bool) -> Array<Element>?{
        outerLoop: for firstIndex in 0..<self.count{
            let firstElement : Element = self[firstIndex]
            for secondIndex in firstIndex+1..<self.count{
                let secondElement = self[secondIndex]
                for thirdIndex in secondIndex+1..<self.count{
                    let possibleMatch = [firstElement,secondElement,self[thirdIndex]]
                    if(matchBy(possibleMatch)){
                        return possibleMatch
                    }
                }
            }
        }
        return nil
    }
}

