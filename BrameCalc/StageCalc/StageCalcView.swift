import SwiftUI

struct StageCalcView: View {
    @State private var width: String = ""
    @State private var depth: String = ""
    @State private var height: String = ""
    @State private var numberOfStairs: String = ""
    @State private var hasGuardRails = false
    @State private var hasCarpet = true
    @State private var hasCottonSkirt = true
    @State private var stage: Stage?

    var body: some View {
        VStack {
            Text("StageCalc")
                .font(.largeTitle)
                .padding(1)
            Text("Scène rectangulaire en praticables")
                .font(.callout)
            Text("Entrez les dimensions :")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Ouverture")
                    .frame(maxWidth: 300)
                
                Text("Profondeur")
                    .frame(maxWidth: 300)
                
                Text("Hauteur")
                    .frame(maxWidth: 300)
            }
            
            HStack {
                TextField("en mètre", text: $width)
                //                    .keyboardType(.decimalPad)
                    .padding()
                    .frame(maxWidth: 300)
                
                TextField("en mètre", text: $depth)
                //                    .keyboardType(.decimalPad)
                    .padding()
                    .frame(maxWidth: 300)
                
                TextField("en centimètre", text: $height)
                //                    .keyboardType(.decimalPad)
                    .padding()
                    .frame(maxWidth: 300)
            }
            
            HStack {
                Toggle("Moquette", isOn: $hasCarpet)
                    .padding()
                
                Toggle("Jupe", isOn: $hasCottonSkirt)
                    .padding()
            }
            
            Button("Calculer") {
                calculateStage()
            }
//            .padding()
            .disabled(!isInputValid())
            
            if let stage = stage {
                ResultView(stage: stage)
//                    .padding(.top, 20)
            }
            
            Spacer()
        }
//        .padding()
        
    }

    private func isInputValid() -> Bool {
        !width.isEmpty && !depth.isEmpty && !height.isEmpty && Int(width) != nil && Int(depth) != nil && Int(height) != nil
    }

    private func calculateStage() {
        guard let width = Int(width),
              let depth = Int(depth),
              let height = Int(height) else {
            // Handle invalid input
            return
        }

        // Assume numberOfStairs is optional and handle accordingly
        let numberOfStairs = Int(numberOfStairs) ?? 0

        let stage = Stage(width: width,
                          depth: depth,
                          height: height,
                          numberOfStairs: numberOfStairs,
                          hasGuardRails: hasGuardRails,
                          hasCarpet: hasCarpet,
                          hasCottonSkirt: hasCottonSkirt)

        // Store the result in the state variable
        self.stage = stage
    }
}

// Assuming you have a ResultView and a Stage model defined
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
            Text("Scène de \(stage.width)m x \(stage.depth)m x \(stage.height)cm")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach(stage.codesArticles.filter { codeArticle in
                    if codeArticle.code.hasPrefix("P/PIED-") {
                        let heightString = codeArticle.code.replacingOccurrences(of: "P/PIED-", with: "")
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
//            .listStyle(GroupedListStyle())
            VStack(alignment: .leading) {
                //            Text("Résultats")
                //                .font(.headline)
                //                .padding()
                Text("Dimensions: \(stage.width) x \(stage.depth) x \(stage.height)")
                //            Text("Rampes de sécurité: \(stage.hasGuardRails ? "Oui" : "Non")")
                //            Text("Moquette: \(stage.hasCarpet ? "Oui" : "Non")")
                //            Text("Jupe: \(stage.hasCottonSkirt ? "Oui" : "Non")")
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Surface: \(stage.calculateSurfaceArea()) m²")
                Text("Coût total des consommables: \(stage.calculateTotalCost()) €")
                //                .font(.headline)
                //                .padding(.bottom, 4)
                Text("Prix moquette m2 posée : 6,5€:")
                Text("Prix cotton gratté mètre linéaire posé : 4€:")
                Text("Longueur de moquette: \(stage.calculateCarpetLength()) m")
                Text("Coût total de la moquette: \(stage.calculateCarpetCost()) €")
                Text("Longueur de coton gratté: \(stage.calculateCottonSkirtLength()) m")
                Text("Coût total du coton gratté: \(stage.calculateCottonSkirtCost()) €")
            }
        }
    }
}
