import Foundation
import UIKit

class GridViewModel {
    let grid: Grid
    let cellCount: Int
    
    init(grid: Grid) {
        self.grid = grid
        self.cellCount = grid.cells.count
    }
    
    func styleCell(view: inout ScrabbleCell, data: Cell) -> ScrabbleCell {
        view.positionLabel.text = textRepresentation(for: data)
        view.positionLabel.textColor = UIColor.black
        view.positionLabel.adjustsFontSizeToFitWidth = true
        view.positionLabel.minimumScaleFactor = 0.2
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.backgroundColor = backgroundColor(for: data)
        return view
    }
    
    func cellAt(path: IndexPath) -> Cell {
        return grid.cells[path[1]]
    }
    
    private func textRepresentation(for cell: Cell) -> String {
        switch (cell.multiplier) {
        case .tripleWord:
            return "3x"
        case .doubleWord:
            return "2x"
        case .tripleLetter:
            return "3x"
        case .doubleLetter:
            return "2x"
        case .noMultiplier:
            return ""
        case .wildCard:
            return ""
        }
    }
    
    private func backgroundColor(for cell: Cell) -> CGColor {
        switch (cell.multiplier) {
        case .tripleWord:
            return UIColor.red.cgColor
        case .doubleWord:
            return UIColor.yellow.cgColor
        case .tripleLetter:
            return UIColor.purple.cgColor
        case .doubleLetter:
            return UIColor.blue.cgColor
        default:
            return UIColor.clear.cgColor
        }
    }
}
