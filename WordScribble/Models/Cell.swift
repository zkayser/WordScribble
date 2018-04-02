import Foundation

struct Cell {
    let position: (row: Int, col: Int)
    let multiplier: Multiplier
    let tile: Tile?
    
    var isCenter: Bool {
        return self.position.row == 8 && self.position.col == 8
    }
    
    static func initCellFor(index: Int) -> Cell {
        return Cell(position: (row: 0, col: 0), multiplier: .noMultiplier, tile: nil)
    }
}
