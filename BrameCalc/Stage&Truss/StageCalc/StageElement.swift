import SwiftUI

struct Stage {
    let width: Int
    let depth: Int
    let height: Int
    let numberOfStairs: Int
    let hasGuardRails: Bool
    let hasCarpet: Bool
    let hasCottonSkirt: Bool
    let coverBack: Bool
    
    let codesArticles = [
        (code: "P/2X1", description: "Praticables de 2m x 1m"),
        (code: "P/1X1", description: "Praticables de 1m x 1m"),
        (code: "P/2X0,5", description: "Praticables de 2m x 0,5m"),
        (code: "P/ATTACHE/S", description: "Attaches simples"),
        (code: "P/ATTACHE/D", description: "Attaches doubles"),
        (code: "P/PIED-20", description: "Pieds de 20cm"),
        (code: "P/PIED-40", description: "Pieds de 40cm"),
        (code: "P/PIED-60", description: "Pieds de 60cm"),
        (code: "P/PIED-80", description: "Pieds de 80cm"),
        (code: "P/PIED-100", description: "Pieds de 100cm"),
        (code: "P/PIED-120", description: "Pieds de 120cm"),
        (code: "P/PIED-160", description: "Réglables 90-160cm"),
        (code: "CO/KIT", description: "Consommable habillage")
    ]
    
    var quantities: [Int] {
        var quantities: [Int] = []
        
        quantities.append(calculateNumberOfPlatforms2x1())
        quantities.append(calculateNumberOfPlatforms1x1())
        quantities.append(calculateNumberOfPlatforms2x05())
        quantities.append(calculateNumberOfSimpleClamps())
        quantities.append(calculateNumberOfDoubleClamps())
        quantities.append(calculateNumberOfFeet(for: height))
        quantities.append(calculateNumberOfFeet(for: height))
        quantities.append(calculateNumberOfFeet(for: height))
        quantities.append(calculateNumberOfFeet(for: height))
        quantities.append(calculateNumberOfFeet(for: height))
        quantities.append(calculateNumberOfFeet(for: height))
        quantities.append(calculateNumberOfFeet(for: height))
        quantities.append(calculateTotalCost())
        
        return quantities
    }
    
    var shouldDisplayGuardRailsAlert: Bool {
        height >= 80 && !hasGuardRails
    }
    
    func calculateSurfaceArea() -> Int {
        width * depth
    }
    
    func calculateNumberOfPlatforms2x1() -> Int {
        (width / 2) * depth
    }
    
    func calculateNumberOfPlatforms1x1() -> Int {
        width % 2 == 0 ? 0 : depth
    }
    
    func calculateNumberOfPlatforms2x05() -> Int {
        width % 2 == 0 ? 0 : (depth / 2)
    }
    
    func calculateNumberOfFeet(for height: Int) -> Int {
        let numberOfPlatforms2x1 = calculateNumberOfPlatforms2x1()
        let numberOfPlatforms1x1 = calculateNumberOfPlatforms1x1()
        let numberOfPlatforms2x05 = calculateNumberOfPlatforms2x05()
        
        let numberOfFeet2x1 = numberOfPlatforms2x1 * 4
        let numberOfFeet1x1 = numberOfPlatforms1x1 * 4
        let numberOfFeet2x05 = numberOfPlatforms2x05 * 4
        
        return numberOfFeet2x1 + numberOfFeet1x1 + numberOfFeet2x05
    }
    
    func calculateNumberOfSimpleClamps() -> Int {
        (2 * (width / 2 - 1)) + (2 * (depth - 1))
    }
    
    func calculateNumberOfDoubleClamps() -> Int {
        let numberOfSimpleClamps = calculateNumberOfSimpleClamps()
        let totalFeet = ((calculateNumberOfPlatforms2x1() + calculateNumberOfPlatforms1x1() + calculateNumberOfPlatforms2x05()) * 4)
        let numberOfDoubleClamps = (totalFeet - 4 - numberOfSimpleClamps) / 4
        return numberOfDoubleClamps
    }
    
    func calculateEscalier() -> Int {
        if height <= 20 {
            return 0
        } else {
            return ((height - 20) / 20) * numberOfStairs
        }
    }
    
    func calculateGarderops() -> Int {
        return (2 * (width + depth)) - width
    }
    
    func calculateCarpetLength() -> Int {
        let surface = calculateSurfaceArea()
        return (surface + 1) / 2 // Round up to nearest whole number of 2m segments
    }
    
    func calculateCottonSkirtLength() ->Int {
        var perimeter = (width + depth) * 2
        if !coverBack {
            perimeter -= width
        }
        return perimeter
    }
    func calculateCarpetCost() -> Int {
        let carpetPricePerSquareMeter = 6.5
        let carpetLength = calculateCarpetLength()
        return Int(carpetPricePerSquareMeter * Double(carpetLength))
    }
    
    func calculateCottonSkirtCost() -> Int {
        let cottonSkirtPrice = 4.0
        let cottonSkirtLength = calculateCottonSkirtLength()
        return Int(cottonSkirtPrice * Double(cottonSkirtLength))
    }
    
    func calculateTotalCost() -> Int {
        calculateCottonSkirtCost() + calculateCarpetCost()
    }
}
