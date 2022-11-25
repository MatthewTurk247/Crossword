//
//  GridState.swift
//  
//
//  Created by Matthew Turk on 11/24/22.
//

import Combine
import Foundation

@available(iOS 13.0, *)
class GridState: ObservableObject {
    @Published var rows: [Array<String>] = [[]]
    @Published var cursorX: Int = 0
    @Published var cursorY: Int = 0

    init() {}
}
