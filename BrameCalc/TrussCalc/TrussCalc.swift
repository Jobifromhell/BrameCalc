import SwiftUI

struct TrussCalcView: View {
    
    enum StructureType: String, CaseIterable, Identifiable {
        case autoportee = "Autoporté"
        case arche = "Arche"
        case grill = "Grill"

        var id: String { self.rawValue }
    }
    
    @StateObject private var stockManager = StockManager()
    @State private var structureType: StructureType = .autoportee
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var height: String = ""
    @State private var selectedTruss: [TrussElement] = []
    @State private var trussCount: [String: Int] = [:]
    @State private var totalWeight: Double = 0.0
    @State private var totalVolume: Double = 0.0
    @State private var totalPins: Int = 0
    @State private var adjustedLength: Double = 0.0
    @State private var adjustedWidth: Double? = nil
    @State private var adjustedHeight: Double = 0.0
    @State private var showAdjustedDimensionsAlert = false
    @State private var showSettingsView = false
   
    var body: some View {
        VStack {
            Text("TrussCalc")
                .font(.largeTitle)
                .padding(1)
            
            Picker("Type de structure", selection: $structureType) {
                ForEach(StructureType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .frame(maxWidth: 400)

            HStack {
                VStack(alignment: .leading) {
                    Text("Longueur")
                        .font(.headline)
                    TextField("en mètre", text: $length)
                        .foregroundColor(.primary)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                .onChange(of: length) { newValue in
                    length = newValue.replacingOccurrences(of: ",", with: ".")
                }
                .padding()
                
                if structureType != .arche {
                    VStack(alignment: .leading) {
                        Text("Largeur")
                            .font(.headline)
                        TextField("en mètre", text: $width)
                            .foregroundColor(.primary)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    .onChange(of: width) { newValue in
                        width = newValue.replacingOccurrences(of: ",", with: ".")
                    }
                    .padding()
                }
                
                if structureType != .grill {
                    VStack(alignment: .leading) {
                        Text("Hauteur")
                            .font(.headline)
                        TextField("en mètre", text: $height)
                            .foregroundColor(.primary)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    .onChange(of: height) { newValue in
                        height = newValue.replacingOccurrences(of: ",", with: ".")
                    }
                    .padding()
                }
            }
            .padding(.horizontal)
            
            HStack {
                Button(action: {
                    calculateTruss()
                }) {
                    Text("Calculer")
                        .font(.headline)
                        .padding(7)
                }
                
                Button(action: {
                    showSettingsView.toggle()
                }) {
                    Text("Stock")
                        .font(.headline)
                        .padding(7)
                }
            }
            .padding()
            
            if trussCount.isEmpty {
                Text("Spécifier les dimensions")
                    .foregroundColor(.primary)
                    .padding()
            } else {
                List {
                    Section(header: Text("Elements Eurotruss")) {
                        ForEach(trussCount.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                            let element = eurotrussFD34.first { $0.name == key.split(separator: " ").first! }
                            let weight = element?.weight ?? 0.0
                            let volume = (element?.length ?? 0.0) * (element?.width ?? 0.0) * (element?.height ?? 0.0)
                            Text("\(key): \(value)")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Section(header: Text("Total")) {
                        Text("Poids Total: \(totalWeight, specifier: "%.2f") kg")
                            .foregroundColor(.primary)
                        Text("Volume Total: \(totalVolume, specifier: "%.2f") m³")
                            .foregroundColor(.primary)
                        Text("Total Goupilles/Sécu: \(totalPins)")
                            .foregroundColor(.primary)
                    }
                }
                .listStyle(PlainListStyle())
                .padding()
            }
            
            Spacer()
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView(stockManager: stockManager)
        }
    }
    
    func calculateTruss() {
        guard let length = Double(length) else {
            // Handle invalid input
            return
        }
        
        let widthValue = structureType != .arche ? Double(width) : nil
        let heightValue = structureType != .grill ? Double(height) : nil
        
        selectedTruss = []
        trussCount = [:]
        totalWeight = 0.0
        totalVolume = 0.0
        totalPins = 0
        
        switch structureType {
        case .autoportee:
            guard let width = widthValue, let height = heightValue else {
                // Handle invalid input for width and height
                return
            }
            let (adjustedLength, adjustedWidth, adjustedHeight) = TrussCalculator.adjustDimensions(length: length, width: width, height: height, trussList: eurotrussFD34)
            self.adjustedLength = adjustedLength
            self.adjustedWidth = adjustedWidth
            self.adjustedHeight = adjustedHeight!
            self.length = String(format: "%.2f", adjustedLength)
            self.width = String(format: "%.2f", adjustedWidth ?? 0)
            self.height = String(format: "%.2f", adjustedHeight!)
            
            self.showAdjustedDimensionsAlert = true
            TrussCalculator.calculateAutoportee(
                length: adjustedLength,
                width: adjustedWidth!,
                height: adjustedHeight!,
                trussList: eurotrussFD34,
                selectedTruss: &selectedTruss,
                trussCount: &trussCount,
                totalWeight: &totalWeight,
                totalVolume: &totalVolume,
                totalPins: &totalPins
            )
        case .arche:
            guard let height = heightValue else {
                // Handle invalid input for height
                return
            }
            let (adjustedLength, _, adjustedHeight) = TrussCalculator.adjustDimensions(length: length, width: nil, height: height, trussList: eurotrussFD34)
            self.adjustedLength = adjustedLength
            self.adjustedHeight = adjustedHeight!
            self.length = String(format: "%.2f", adjustedLength)
            self.height = String(format: "%.2f", adjustedHeight!)
            
            self.showAdjustedDimensionsAlert = true
            TrussCalculator.calculateArche(
                length: adjustedLength,
                height: adjustedHeight!,
                trussList: eurotrussFD34,
                selectedTruss: &selectedTruss,
                trussCount: &trussCount,
                totalWeight: &totalWeight,
                totalVolume: &totalVolume,
                totalPins: &totalPins
            )
        case .grill:
            guard let width = widthValue else {
                // Handle invalid input for width
                return
            }
            let (adjustedLength, adjustedWidth, _) = TrussCalculator.adjustDimensions(length: length, width: width, trussList: eurotrussFD34)
            self.adjustedLength = adjustedLength
            self.adjustedWidth = adjustedWidth
            self.length = String(format: "%.2f", adjustedLength)
            self.width = String(format: "%.2f", adjustedWidth ?? 0)
            
            self.showAdjustedDimensionsAlert = true
            TrussCalculator.calculateGrill(
                length: adjustedLength,
                width: adjustedWidth!,
                trussList: eurotrussFD34,
                selectedTruss: &selectedTruss,
                trussCount: &trussCount,
                totalWeight: &totalWeight,
                totalVolume: &totalVolume,
                totalPins: &totalPins
            )
        }
    }
}

class StockManager: ObservableObject {
    @Published var stock: [String: Bool] = [:]
    
    init() {
        loadStock()
    }
    
    func loadStock() {
        if let savedStock = UserDefaults.standard.dictionary(forKey: "trussStock") as? [String: Bool] {
            stock = savedStock
        } else {
            stock = Dictionary(uniqueKeysWithValues: eurotrussFD34.map { ($0.name, true) })
        }
    }
    
    func saveStock() {
        UserDefaults.standard.set(stock, forKey: "trussStock")
    }
}
