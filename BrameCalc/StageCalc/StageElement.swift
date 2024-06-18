import SwiftUI

struct Stage {
    let width: Int
    let depth: Int
    let height: Int
    let numberOfStairs: Int
    let hasGuardRails: Bool
    let hasCarpet: Bool
    let hasCottonSkirt: Bool
    
    let codesArticles = [
        (code: "P/2X1", description: "Praticables de 2m x 1m"),
        (code: "P/1X1", description: "Praticables de 1m x 1m"),
        (code: "P/ATTACHE/S", description: "Attaches simples"),
        (code: "P/ATTACHE/D", description: "Attaches doubles _BUG_"),
        (code: "P/PIED-20", description: "Pieds de 20cm"),
        (code: "P/PIED-40", description: "Pieds de 40cm"),
        (code: "P/PIED-60", description: "Pieds de 60cm"),
        (code: "P/PIED-80", description: "Pieds de 80cm"),
        (code: "P/PIED-100", description: "Pieds de 100cm"),
        (code: "P/ESCALIER", description: "Marche de 20 cm"),
        (code: "P/GCR", description: "Garde corps réglable de 2 à 3m _BUG_"),
        (code: "CO/KIT", description: "Prix total pour l'habillage")
    ]
    
    var quantities: [Int] {
          var quantities: [Int] = []
          
          quantities.append(calculateNumberOfPlatforms2x1())
          quantities.append(calculateNumberOfPlatforms1x1())
          quantities.append(calculateNumberOfSimpleClamps())
          quantities.append(calculateNumberOfDoubleClamps())
          quantities.append(calculateNumberOfFeet())
          quantities.append(calculateNumberOfFeet())
          quantities.append(calculateNumberOfFeet())
          quantities.append(calculateNumberOfFeet())
          quantities.append(calculateNumberOfFeet())
          quantities.append(calculateEscalier())
          quantities.append(calculateGarderops())
          quantities.append(calculateTotalCost())
          
          return quantities
      }
    
    
    var shouldDisplayGuardRailsAlert: Bool {
        height >= 50 && !hasGuardRails
    }
    
    func calculateSurfaceArea() -> Int {
        width * depth
    }
    
    func calculateNumberOfPlatforms2x1() -> Int {
        width * depth / 2
    }
    func calculateNumberOfPlatforms1x1() -> Int {
        let surface = calculateSurfaceArea()
        return surface.isMultiple(of: 2) ? 0 : 1
    }
    func calculateNumberOfFeet() -> Int {
        let numberOfPlatforms2x1 = calculateNumberOfPlatforms2x1()
        let numberOfPlatforms1x1 = calculateNumberOfPlatforms1x1()
        let numberOfFeet2x1 = numberOfPlatforms2x1 * 4
        let numberOfFeet1x1 = numberOfPlatforms1x1 * 4
        return numberOfFeet2x1 + numberOfFeet1x1
    }
    func calculateNumberOfSimpleClamps() -> Int {
        (2 * (width / 2 - 1)) + (2 * (depth - 1))
    }
    
    func calculateNumberOfDoubleClamps() -> Int {
        let numberOfSimpleClamps = calculateNumberOfSimpleClamps()
        let totalFeet = ((calculateNumberOfPlatforms2x1() + calculateNumberOfPlatforms1x1() ) * 4)
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
            let carpetLength = Int(ceil(Double(calculateSurfaceArea()) / 2))
            let carpetLengthToEven = carpetLength.isMultiple(of: 2) ? carpetLength : carpetLength + 1
            return carpetLengthToEven
        }
        
        func calculateCottonSkirtLength() -> Int {
            (width + depth) * 2
        }
        
        func calculateCarpetCost() -> Int {
            let carpetPricePerSquareMeter = 6.5
            let carpetLength = Int(calculateSurfaceArea()) / 2
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
