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
            return UIColor(red:0.84, green:0.21, blue:0.21, alpha:1.0).cgColor
        case .doubleWord:
            return UIColor(red:1.00, green:0.53, blue:0.62, alpha:1.0).cgColor
        case .tripleLetter:
            return UIColor(red:0.32, green:0.32, blue:0.72, alpha:1.0).cgColor
        case .doubleLetter:
            return UIColor(red:0.47, green:0.78, blue:0.88, alpha:1.0).cgColor
        default:
            return UIColor.clear.cgColor
        }
    }
}
