import SwiftUI

struct CO2CalculationView: View {
    @State private var tentWidth: String = ""
    @State private var tentDepth: String = ""
    @State private var tentHeight: String = ""
    @State private var stageType: String = "AlphaStage240"
    @State private var attendeeCount: String = ""
    @State private var eventDurationHours: String = ""
    @State private var totalCO2: Double?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Calcul du Bilan Carbone")
                .font(.largeTitle)
                .padding(.bottom, 10)
            
            //            Group {
            //                Text("Dimensions de la Tente")
            //                HStack {
            //                    TextField("Largeur (m)", text: $tentWidth)
            //                        .textFieldStyle(RoundedBorderTextFieldStyle())
            ////                        .keyboardType(.decimalPad)
            //                    TextField("Profondeur (m)", text: $tentDepth)
            //                        .textFieldStyle(RoundedBorderTextFieldStyle())
            ////                        .keyboardType(.decimalPad)
            //                    TextField("Hauteur (m)", text: $tentHeight)
            //                        .textFieldStyle(RoundedBorderTextFieldStyle())
            ////                        .keyboardType(.decimalPad)
            //                }
            //                
            //                Text("Type de Scène")
            //                Picker("Type de Scène", selection: $stageType) {
            //                    Text("AlphaStage240").tag("AlphaStage240")
            //                    // Add more stage types as needed
            //                }
            //                .pickerStyle(SegmentedPickerStyle())
            //                
            //                Text("Nombre de Participants")
            //                TextField("Participants", text: $attendeeCount)
            //                    .textFieldStyle(RoundedBorderTextFieldStyle())
            //                    .keyboardType(.numberPad)
            //                
            //                Text("Durée de l'Événement (heures)")
            //                TextField("Durée (h)", text: $eventDurationHours)
            //                    .textFieldStyle(RoundedBorderTextFieldStyle())
            //                    .keyboardType(.decimalPad)
            //            }
            //            
            //            Button(action: calculateCO2) {
            //                Text("Calculer le CO2")
            //                    .font(.headline)
            //                    .padding()
            //                    .foregroundColor(.white)
            //                    .background(Color.green)
            //                    .cornerRadius(10)
            //            }
            //            
            //            if let totalCO2 = totalCO2 {
            //                Text("Total CO2 : \(totalCO2, specifier: "%.2f") kg")
            //                    .font(.title2)
            //                    .padding(.top, 20)
            //            }
            //            
            //            Spacer()
            //        }
            //        .padding()
            //    }
            //    
            //    private func calculateCO2() {
            //        guard let width = Double(tentWidth),
            //              let depth = Double(tentDepth),
            //              let height = Double(tentHeight),
            //              let attendees = Int(attendeeCount),
            //              let duration = Double(eventDurationHours) else {
            //            // Handle invalid input
            //            return
            //        }
            //        
            //        totalCO2 = CarbonFootprintCalculator.calculateCO2(
            //            tentSize: (width, depth, height),
            //            stageType: stageType,
            //            attendeeCount: attendees,
            //            eventDurationHours: duration
            //        )
        }
    }
}

//struct CO2CalculationView_Previews: PreviewProvider {
//    static var previews: some View {
//        CO2CalculationView()
//    }
//}
