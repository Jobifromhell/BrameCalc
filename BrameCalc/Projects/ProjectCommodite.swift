import SwiftUI

struct CommoditesView: View {
    @Binding var project: Project
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Commodités")
                .font(.headline)
            
//            TextField("Commodités disponibles", text: $project.amenities)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.bottom)
            
            Spacer()
        }
        .padding()
    }
}

