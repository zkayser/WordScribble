import Foundation

typealias Position = (row: Int, col: Int)

struct Cell {
    let position: Position
    let multiplier: Multiplier
    let tile: Tile?
    
    var isCenter: Bool {
        return self.position.row == 8 && self.position.col == 8
    }
    
    static func initCellFor(index: Int) -> Cell {
        let position = self.position(for: index)
        let multiplier = self.multiplier(for: position)
        
        return Cell(position: position, multiplier: multiplier, tile: nil)
    }
    
    private static func position(for number: Int) -> Position {
        let row = (number % 15 == 0) ? (number / 15) : Int(ceil(Double(number) / 15 as Double))
        let column = (number % 15 == 0) ? 15 : (number % 15)
        return (row: row, col: column)
    }
    
    private static func multiplier(for position: Position) -> Multiplier {
        if Cell.tripleWordPositions.contains(where: { $0 == position }) {
            return .tripleWord
        } else if Cell.doubleWordPositions.contains(where: { $0 == position}) {
            return .doubleWord
        } else if Cell.tripleLetterPositions.contains(where: { $0 == position}) {
            return .tripleLetter
        } else if Cell.doubleLetterPositions.contains(where: { $0 == position}) {
            return .doubleLetter
        } else {
            return .noMultiplier
        }
    }
    
    static private let tripleWordPositions: [Position] = [
        (row: 1, col: 1),
        (row: 1, col: 8),
        (row: 1, col: 15),
        (row: 8, col: 1),
        (row: 8, col: 15),
        (row: 15, col: 1),
        (row: 15, col: 8),
        (row: 15, col: 15)
    ]
    
    static private let doubleWordPositions: [Position] = [
        (row: 2, col: 2),
        (row: 3, col: 3),
        (row: 4, col: 4),
        (row: 5, col: 5),
        (row: 8, col: 8),
        (row: 11, col: 11),
        (row: 12, col: 12),
        (row: 13, col: 13),
        (row: 14, col: 14),
        (row: 2, col: 14),
        (row: 3, col: 13),
        (row: 4, col: 12),
        (row: 5, col: 11),
        (row: 11, col: 5),
        (row: 12, col: 4),
        (row: 13, col: 3),
        (row: 14, col: 2)
    ]
    
    static private let tripleLetterPositions: [Position] = [
        (row: 2, col: 6),
        (row: 6, col: 6),
        (row: 10, col: 6),
        (row: 14, col: 6),
        (row: 10, col: 10),
        (row: 14, col: 10),
        (row: 6, col: 2),
        (row: 10, col: 2),
        (row: 6, col: 14),
        (row: 10, col: 14)
    ]
    
    static private let doubleLetterPositions: [Position] = [
        (row: 1, col: 4),
        (row: 1, col: 12),
        (row: 3, col: 7),
        (row: 3, col: 9),
        (row: 4, col: 1),
        (row: 4, col: 8),
        (row: 4, col: 15),
        (row: 7, col: 3),
        (row: 7, col: 7),
        (row: 7, col: 9),
        (row: 7, col: 13),
        (row: 8, col: 4),
        (row: 8, col: 12),
        (row: 9, col: 3),
        (row: 9, col: 7),
        (row: 9, col: 9),
        (row: 9, col: 13),
        (row: 12, col: 1),
        (row: 12, col: 8),
        (row: 12, col: 15),
        (row: 13, col: 7),
        (row: 13, col: 9),
        (row: 15, col: 4),
        (row: 15, col: 12)
    ]

}
