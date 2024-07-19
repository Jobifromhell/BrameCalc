
import SwiftUI
import AppKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
                .frame(minWidth: 180) // Taille fixe pour la barre latérale
            
            MainView()
                .frame(minWidth: 700, minHeight: 800, maxHeight: .infinity) // S'adapte à la taille de la fenêtre
        }
    }
}

struct Sidebar: View {
    var body: some View {
        VStack {
            List {
                Section(header: Text("Groupe Brame")) {
                    NavigationLink(destination: ContactView()) {
                        Label("Contact", systemImage: "phone.fill")
                    }
                }
                
                Section(header: Text("Projets")) {
                    NavigationLink(destination: ProjectMenuView()) {
                        Label("Projets", systemImage: "folder.fill")
                    }
                }
                
                Section(header: Text("Outils Scène & Truss")) {
                    NavigationLink(destination: StageCalcView()) {
                        Label("StageCalc", systemImage: "rectangle.3.offgrid.fill")
                    }
                    NavigationLink(destination: TrussCalcView()) {
                        Label("TrussCalc", systemImage: "scalemass.fill")
                    }
                }
                
                Section(header: Text("Outils Audio")) {
                    NavigationLink(destination: AmpLoadCalcView()) {
                        Label("AmpLoad", systemImage: "speaker.3.fill")
                    }
                }
                
                Section(header: Text("Outils Light")) {
                    NavigationLink(destination: GelCalcView()) {
                        Label("GelCalc", systemImage: "lightbulb.fill")
                    }
                }
                
                Section(header: Text("Event Timer")) {
                    NavigationLink(destination: ScheduleView()) {
                        Label("Planner", systemImage: "calendar")
                    }
                }
                
                Section(header: Text("RSE")) {
                    NavigationLink(destination: RSEObjectiveView()) {
                        Label("Objectifs", systemImage: "leaf.fill")
                    }
                    NavigationLink(destination: CO2CalculationView()) {
                        Label("Bilan Carbone", systemImage: "leaf.fill")
                    }
                }

                Section(header: Text("Documents")) {
                    NavigationLink(destination: DocumentsView()) {
                        Label("Téléchargements", systemImage: "doc.fill")
                    }
                }
            }
            .listStyle(SidebarListStyle())
            
            Spacer()
        }
    }
}

struct MainView: View {
    var body: some View {
        Image("GROUPE-BRAME-PNG")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .opacity(0.5)
            .frame(maxWidth: 400) // Taille maximale de l'image
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
