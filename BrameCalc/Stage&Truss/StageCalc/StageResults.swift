
import SwiftUI

struct ResultView: View {
    let stage: Stage
    @Environment(\.presentationMode) var presentationMode
    
    func getQuantityText(for code: String, stage: Stage) -> String {
        guard let index = stage.codesArticles.firstIndex(where: { $0.code == code }),
              stage.quantities.indices.contains(index) else {
            return ""
        }
        return "\(stage.quantities[index])"
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Scène de \(stage.width)m x \(stage.depth)m x \(stage.height)cm - \(stage.calculateSurfaceArea())m2")
                .font(.headline)
                .fontWeight(.bold)
            
            List {
                ForEach(stage.codesArticles.filter { codeArticle in
                    if codeArticle.code.hasPrefix("P/PIED-") {
                        let heightString = codeArticle.code.replacingOccurrences(of: "P/PIED-", with: "")
                        if heightString == "160" && stage.height == 160 {
                            return true // Spécial pour pieds réglables
                        }
                        if let height = Int(heightString) {
                            return height == stage.height
                        }
                    }
                    return true
                }.filter { codeArticle in
                    let index = stage.codesArticles.firstIndex { $0.code == codeArticle.code } ?? 0
                    return stage.quantities[index] != 0
                }, id: \.code) { codeArticle in
                    HStack {
                        Text(codeArticle.code)
                        Spacer()
                        Text(codeArticle.description)
                        Spacer()
                        Text(getQuantityText(for: codeArticle.code, stage: stage))
                            .multilineTextAlignment(.trailing)
                            .padding(8)
                            .frame(width: 100)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
            }
            
            List {
                VStack(alignment: .leading) {
                    Text("Surface: \(stage.calculateSurfaceArea()) m²")
                    
                    Spacer(minLength: 10)
                    
                    Text("Coût total des consommables: \(stage.calculateTotalCost()) €")
                    
                    Spacer(minLength: 10)
                    
                    Text("Coût total de la moquette: \(stage.calculateCarpetCost()) €")
                    
                    Text("Coût total du coton gratté: \(stage.calculateCottonSkirtCost()) €")
                    
                    Spacer(minLength: 10)
                    Text("Longueur de moquette: \(stage.calculateCarpetLength()) m")
                    Text("Longueur de coton gratté: \(stage.calculateCottonSkirtLength()) m")
                }
            }
        }
    }
}
