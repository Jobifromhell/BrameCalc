import SwiftUI

class StageCalcPref: ObservableObject {
    @Published var carpetPricePerMeter: Double = 6.5
    @Published var cottonPricePerMeter: Double = 4.0
    @Published var coverBack: Bool = true

}

struct PreferencesView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var preferences: StageCalcPref
    
    var body: some View {
        VStack {
            Text("Préférences")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Text("Prix moquette (HT/m² posée):")
                TextField("Prix moquette", value: $preferences.carpetPricePerMeter, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .frame(width: 300)
            .padding()
            
            HStack {
                Text("Prix coton gratté (HT/mètre linéaire posée):")
                TextField("Prix coton gratté", value: $preferences.cottonPricePerMeter, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .frame(width: 300)
            .padding()
            Toggle("Jupe sur l'arrière de la scène", isOn: $preferences.coverBack)

            Button("Fermer") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}
