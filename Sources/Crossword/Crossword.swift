import Combine
import Foundation
import SwiftUI

@available(iOS 16.0, *)
public struct Crossword: View {
    var across: [String]
    var down: [String]
    @ObservedObject private var grid = GridState()
    @State private var exampleString = ""
    
    // public private(set) var text = "Hello, World!"

    public init<T>(across: any RandomAccessCollection<T>, down: any RandomAccessCollection<T>) where T: StringProtocol {
        self.across = across.map { String($0).uppercased() }
        self.down = down.map { String($0).uppercased() }
        grid.rows = [["", "", ""],
                     ["", "", ""],
                     ["", "", ""]]
    }
    
    // TODO: Create initializer that takes in the path of a crossword file (blanking on the extension).
    
    // TODO: Add support for custom layout/style for clues listed below crossword.
    
    /*public init(across: Dictionary<String, String>, down: Dictionary<String, String>) {
        self.across = across.map({ clue, answer in
            return Entry(clue: clue, answer: answer, row: 0, column: 0)
        })
        
        self.down = down.map({ clue, answer in
            return Entry(clue: clue, answer: answer, row: 0, column: 0)
        })
    }*/
    
    /// Iniitialize with an array of rows, each of which contains some number of strings (answers) and may be associated with a number corresponding to the clue.
    /*public init(grid: [[Int: any RandomAccessCollection<String>]], answers: Dictionary<Int, String>) {
        
    }*/
    
    /*public init(rows: (Text) -> some View, columns: (Text) -> some View) {
        
    }*/
    
    /*
     Crossword(across: ["something", "another", "answer"], down: ["something", "another", "answer"])
        .clues { cluesDict[$0] }
        .positions { $0 }
     
     Crossword(clues: ["something", "another clue", "another one"])
        .across { acrossDict[$0] }
        .down { downDict[$0] } // given clues and no answers, generates a blank n-by-n grid, where n is the number of clues passed in
        .positions { $0 } // explicitly state grid layout of clues; potentially overrides randomly generated layout
     
     
     
     Crossword(clues: clues) { index, clue in
        Row(answersDict[clue])
     }
     */
    
    public var body: some View {
        Grid(horizontalSpacing: 5, verticalSpacing: 5) {
            ForEach(0...2, id: \.self) { index in
                GridRow {
                    ForEach(0...2, id: \.self) { column in
                        TextField("", text: $grid.rows[index][column])
                            .onReceive(Just(grid)) { _ in
                                limitText(to: 1)
                            }
                            .background(Color.white)
                            .font(.system(size: 48))
                            .bold().multilineTextAlignment(.center)
                    }
                }.padding(.horizontal, 0)
            }
        }.border(Color.black, width: 5).background(Color.black)
    }
                                       
    private func limitText(to upperBound: Int) {
        if exampleString.count > upperBound {
            exampleString = String(exampleString.prefix(upperBound))
        }
    }

    // tuple of clue and answer
    /*public init(content: @escaping () -> Content) {
        self.content = content
    }*/
    
    /*public func body(content: Content) -> some View {
        Text("hello")
    }*/
}

/*
Crossword(across: any RandomAccessCollection<Entry>, down: any RandomAccessCollection<Entry>, content: (Identifiable) -> View) {
    Text().row() // Text view modifier
    Row(clue: "Two plus two", answer: "four")
    Column()
    Column()
    Row()
}
*/

@available(iOS 16.0, *)
struct Crossword_Previews: PreviewProvider {
    static var previews: some View {
        Crossword(across: ["Jupiter"], down: ["Field", "Adams"])
    }
}
