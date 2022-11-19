import Combine
import Foundation
import SwiftUI

@available(iOS 16.0, *)
public struct Crossword: View {
    var across: any RandomAccessCollection<Entry>
    var down: any RandomAccessCollection<Entry> // RandomAccessCollection<Dictionary<String, String>>
    var verbatim: [String: String] = [:]
    @State private var cursorX: [Int: String] = [0: ""]
    @State private var cursorY: [Int: String] = [0: ""]
    @State private var exampleString = ""
    
    // public private(set) var text = "Hello, World!"

    public init(across: any RandomAccessCollection<Entry>, down: any RandomAccessCollection<Entry>) {
        self.across = across
        self.down = down
    }
    
    public init(_ verbatim: Dictionary<String, String>) {
        self.across = []
        self.down = []
        self.verbatim = verbatim
    }
    
    /*public init(rows: (Text) -> some View, columns: (Text) -> some View) {
        
    }*/
    
    public var body: some View {
        Grid(horizontalSpacing: 5, verticalSpacing: 5) {
            ForEach(0...4, id: \.self) { _ in
                GridRow {
                    ForEach(0...4, id: \.self) { _ in
                        TextField("", text: $exampleString)
                            .onReceive(Just(exampleString)) { _ in
                                limitText(to: 1)
                            }
                            .background(Color.white)
                            .font(.system(size: 48))
                            .bold().multilineTextAlignment(.center)
                    }
                }
            }
        }.border(Color.black, width: 5).background(Color.black)
    }
                                       
    private func limitText(to upperBound: Int) {
        if exampleString.count > upperBound {
            exampleString = String(exampleString.prefix(upperBound))
        }
    }
    
    
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
 
 Crossword() {
    Text()
    Text()
 }, answers: {
    Text()
    Text()
 }.foregroundColor(.red)

Crossword(across: , down: )
*/

@available(iOS 16.0, *)
struct Crossword_Previews: PreviewProvider {
    static var previews: some View {
        Crossword(across: [], down: [])
    }
}
