import SwiftUI

struct StageCalcView: View {
    @State private var width: String = ""
    @State private var depth: String = ""
    @State private var selectedHeight: String = "100"
    @State private var numberOfStairs: String = ""
    @State private var hasGuardRails = false
    @State private var hasCarpet = true
    @State private var hasCottonSkirt = true
    @State private var stage: Stage?
    @State private var showPreferences = false
    @StateObject var preferences = StageCalcPref()
    
    let footHeights = ["20", "40", "60", "80", "100", "120", "90->160"]
    
    var body: some View {
        VStack {
            HStack {
                Text("StageCalc")
                    .font(.largeTitle)
                    .padding()
                    .bold()

                Spacer()
                Button("Préférences") {
                    showPreferences.toggle()
                }
                .padding()
                .sheet(isPresented: $showPreferences) {
                    PreferencesView(preferences: preferences)
                }
            }
            .padding(.horizontal)

            Divider()

            VStack(alignment: .leading) {
                Text("Scène rectangulaire en praticables")
                    .font(.subheadline)
                Text("Entrez les dimensions :")
                    .font(.headline)
                    .padding()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Ouverture")
                            .font(.headline)
                        TextField("en mètre", text: $width)
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .frame(width: 100)
                            .padding(.bottom, 8)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Profondeur")
                            .font(.headline)
                        TextField("en mètre", text: $depth)
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .frame(width: 100)
                            .padding(.bottom, 8)
                    }
                    VStack(alignment: .leading) {
                        Text("Hauteur")
                            .font(.headline)
                        Picker("", selection: $selectedHeight) {
                            ForEach(footHeights, id: \.self) { height in
                                Text(height).tag(height)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 100)
                        .padding(.bottom, 8)
                    }
                }
                
//                HStack {
//                    Toggle("Moquette", isOn: $hasCarpet)
//                        .padding(.trailing)
//                    
//                    Toggle("Jupe", isOn: $hasCottonSkirt)
//                }
//                .padding(.top)

                HStack {
                    Button("Calculer") {
                        calculateStage()
                    }
                    .disabled(!isInputValid())
                    .padding()
                    .background(isInputValid() ? Color.gray : Color.clear)
//                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
//                    Button("Préférences") {
//                        showPreferences.toggle()
//                    }
//                    .padding()
//                    .background(Color.clear)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
                }
//                .padding(.top)

                if let stage = stage {
                    ResultView(stage: stage)
                        .padding(.top, 20)
                    
                    StageView(stage: stage)
                        .padding(.top, 20)
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
    
    private func isInputValid() -> Bool {
        !width.isEmpty && !depth.isEmpty && Int(width) != nil && Int(depth) != nil
    }
    
    private func calculateStage() {
        guard let width = Int(width),
              let depth = Int(depth) else {
            // Handle invalid input
            return
        }
        
        let height: Int
        if selectedHeight == "90->160" {
            height = 160 // Assigner la valeur maximale pour les pieds réglables
        } else if let fixedHeight = Int(selectedHeight) {
            height = fixedHeight
        } else {
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
                          hasCottonSkirt: hasCottonSkirt, coverBack: preferences.coverBack)
        
        // Store the result in the state variable
        self.stage = stage
    }
}
