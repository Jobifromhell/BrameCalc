//
//import SwiftUI
//
//struct TabDetailView: View {
//    @Binding var selectedTab: Int
//    @ObservedObject var project: Project
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
////            switch selectedTab {
////            case 1:
////                Text("Accès")
////                TextField("Accès", text: $project.accessDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            case 2:
////                Text("Électricité")
////                TextField("Électricité", text: $project.electricalDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            case 3:
////                Text("Sonorisation")
////                TextField("Sonorisation", text: $project.soundDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            case 4:
////                Text("Éclairage")
////                TextField("Éclairage", text: $project.lightingDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            case 5:
////                Text("Vidéo")
////                TextField("Vidéo", text: $project.videoDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            case 6:
////                Text("Tente")
////                TextField("Tente", text: $project.tentDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            case 7:
////                Text("Structure")
////                TextField("Structure", text: $project.structureDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            case 8:
////                Text("Animation")
////                TextField("Animation", text: $project.animationDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            case 9:
////                Text("Techniciens")
////                TextField("Techniciens", text: $project.technicianDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            default:
////                Text("Informations générales")
////                TextField("Détails techniques", text: $project.technicalDetails)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            }
//            
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct TabDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabDetailView(selectedTab: .constant(0), project: Project())
//    }
//}
