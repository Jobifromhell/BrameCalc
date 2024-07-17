import SwiftUI

struct BesoinsView: View {
    @Binding var project: Project
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Besoins")
                .font(.headline)
            
//            TextField("Besoins spécifiques", text: $project.requirements)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.bottom)
            
            Spacer()
        }
        .padding()
    }
}

struct BesoinsView_Previews: PreviewProvider {
    static var previews: some View {
        BesoinsView(project: .constant(Project()))
    }
}
