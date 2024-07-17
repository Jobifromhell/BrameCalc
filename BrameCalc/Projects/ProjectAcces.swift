import SwiftUI

struct AccesVehiculesView: View {
    @Binding var project: Project
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Accès Véhicules")
                .font(.headline)
            
//            TextField("Accès pour véhicules", text: $project.vehicleAccess)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.bottom)
            
            Spacer()
        }
        .padding()
    }
}

