//import SwiftUI
//
//struct ResultView: View {
//    var stage: Stage
//    
//    var body: some View {
//        VStack {
//            Text("Résultats")
//                .font(.headline)
//                .padding()
//            Text("Largeur: \(stage.width) mètres")
//            Text("Profondeur: \(stage.depth) mètres")
//            Text("Hauteur: \(stage.height) centimètres")
//            Text("Nombre de marches: \(stage.numberOfStairs)")
//            Text("Rampes de sécurité: \(stage.hasGuardRails ? "Oui" : "Non")")
//            Text("Moquette: \(stage.hasCarpet ? "Oui" : "Non")")
//            Text("Jupe: \(stage.hasCottonSkirt ? "Oui" : "Non")")
//        }
//        .padding()
//    }
//}
//
//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        let stage = Stage(width: 10, depth: 5, height: 3, numberOfStairs: 4, hasGuardRails: true, hasCarpet: false, hasCottonSkirt: true)
//        ResultView(stage: stage)
//    }
//}
