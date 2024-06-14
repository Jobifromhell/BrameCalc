import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            MainView()
//                .frame(width: 600, height: 600) // Définissez la taille souhaitée pour la vue
        }
    }
}

struct Sidebar: View {
    var body: some View {
        List {
            NavigationLink(destination: StageCalcView()) {
                Label("StageCalc", systemImage: "rectangle.3.offgrid")
            }
            NavigationLink(destination: GelCalcView()) {
                Label("GelCalc", systemImage: "lightbulb")
            }
            NavigationLink(destination: TrussCalcView()) {
                Label("TrussCalc", systemImage: "scalemass")
            }
            NavigationLink(destination: AmpLoadCalcView()) {
                Label("AmpLoad", systemImage: "scalemass")
            }
            NavigationLink(destination: PrealignementDelayView()) {
                Label("Pre Alignement Delay", systemImage: "person.2")
            }
            NavigationLink(destination: WaveLengthView()) {
                Label("Longueur d'onde", systemImage: "waveform")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct MainView: View {
    var body: some View {
        Text("Sélectionnez un outil dans la barre latérale")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .frame(width: 600, height: 600) // Définissez la taille souhaitée pour la vue

    }
}
