import SwiftUI

struct ProjectContactView: View {
    @Binding var project: Project
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Contact")
                .font(.headline)
            
            TextField("Informations de contact", text: $project.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)
            
            Spacer()
        }
        .padding()
    }
}

