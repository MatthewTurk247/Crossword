//
//  Entry.swift
//  
//
//  Created by Matthew Turk on 11/9/22.
//

import Foundation

open class Entry {
    var clue: String
    var answer: String
    var row: Int
    var column: Int
    var contents: String
    
    init(clue: String, answer: String, row: Int, column: Int) {
        self.clue = clue
        self.answer = answer
        self.row = row
        self.column = column
        self.contents = ""
    }
}
