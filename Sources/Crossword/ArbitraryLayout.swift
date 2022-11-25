//
//  ArbitraryLayout.swift
//  
//
//  Created by Matthew Turk on 11/24/22.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
private extension Crossword {
    enum Direction {
        case across
        case down
    }
    

    func canPlace(_ word: String, row: Int, column: Int, direction: Direction?) -> Bool {
        if row >= self.down.count || column >= self.across.count {
            return false
        }
        /*} else if self.across[column].contents.isEmpty || (word.count == 1 && word == self.across[column].contents) {
            return true
        }*/
        // self.gridCellAnchor
        return false
    }
    
    func generateLayout() -> [Array<String>] {
        return [[]]
    }
    
    
}
