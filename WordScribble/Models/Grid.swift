import Foundation

class Grid {
    let cells: [Cell]
    
    init() {
        self.cells = Array(1...225).map { index in Cell.initCellFor(index: index) }
    }
}
