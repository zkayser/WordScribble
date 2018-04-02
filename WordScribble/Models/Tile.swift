import Foundation

struct Tile {
    let id: Int
    let letter: Character
    let multiplier: Multiplier = .noMultiplier
    let value: Int
}
