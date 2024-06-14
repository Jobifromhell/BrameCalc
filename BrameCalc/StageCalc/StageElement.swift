import SwiftUI

struct Stage {
    let width: Int
    let depth: Int
    let height: Int
    let numberOfStairs: Int
    let hasGuardRails: Bool
    let hasCarpet: Bool
    let hasCottonSkirt: Bool
    
    var shouldDisplayGuardRailsAlert: Bool {
        height >= 80 && !hasGuardRails
    }
   
    func calculateSurfaceArea() -> Int {
        width * depth
    }
    
    func calculateNumberOfPlatforms() -> Int {
        width * depth / 2
    }
    
    func calculateNumberOfSimpleClamps() -> Int {
        (2 * (width / 2 - 1)) + (2 * (depth - 1))
    }
    
    func calculateNumberOfDoubleClamps() -> Int {
        let junctions = calculateNumberOfPlatforms() / 4
        return Int(Double(junctions) * 1.5)
    }
    
    func calculateCarpetLength() -> Int {
        let carpetLength = Int(ceil(Double(calculateSurfaceArea()) / 2))
        let carpetLengthToEven = carpetLength.isMultiple(of: 2) ? carpetLength : carpetLength + 1
        return carpetLengthToEven
    }
    
    func calculateCottonSkirtLength() -> Int {
        (width + depth) * 2
    }
    
    func calculateCarpetCost() -> Double {
        let carpetPricePerSquareMeter = 6.5
        let carpetLength = Double(calculateSurfaceArea()) / 2
        return carpetPricePerSquareMeter * carpetLength
    }
    
    func calculateCottonSkirtCost() -> Double {
        let cottonSkirtPrice = 4.0
        let cottonSkirtLength = Double(calculateCottonSkirtLength())
        return cottonSkirtPrice * cottonSkirtLength
    }
    
    func calculateTotalCost() -> Int {
        Int(calculateCottonSkirtCost() + calculateCarpetCost())
    }
}
