//import SwiftUI
//
//struct LieuView: View {
//    @Binding var project: Project
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Lieu")
//                .font(.headline)
//            
//            TextField("Informations sur le lieu", text: $project.eventLocation)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.bottom)
//            
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct LieuView_Previews: PreviewProvider {
//    static var previews: some View {
//        LieuView(project: .constant(Project()))
//    }
//}
