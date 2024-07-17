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
//                    NavigationLink(destination: ContactView()) {
//                        Label("Organigramme", systemImage: "person.3.fill")
//                    }
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
//                    NavigationLink(destination: PrealignementDelayView()) {
//                        Label("Alignement Delay", systemImage: "timer")
//                    }
//                    NavigationLink(destination: WaveLengthView()) {
//                        Label("Longueur d'onde", systemImage: "waveform.path.ecg")
//                    }
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
//                                    NavigationLink(destination: RSEAccomplishmentView()) {
//                                        Label("Réalisations", systemImage: "checkmark.seal.fill")
//                                    }
//                                    NavigationLink(destination: CO2CalculationView()) {
//                                        Label("Bilan Carbone", systemImage: "leaf.fill")
//                                    }
                                }
                            }
                            .listStyle(SidebarListStyle())
                            
                            Spacer()
            
            HStack {
                Button(action: printMainView) {
                    Label("Imprimer", systemImage: "printer")
                }
                .padding()
            }
        }
    }
    
    private func printMainView() {
        guard let mainView = NSApplication.shared.windows.first?.contentView?.superview else {
            print("Erreur : Impossible de trouver la vue principale.")
            return
        }
        
        let printInfo = NSPrintInfo.shared
        printInfo.horizontalPagination = .fit
        printInfo.verticalPagination = .fit
        printInfo.orientation = .portrait
        printInfo.isHorizontallyCentered = true
        printInfo.isVerticallyCentered = true
        
        let printOperation = NSPrintOperation(view: mainView)
        printOperation.printInfo = printInfo
        printOperation.canSpawnSeparateThread = true
        printOperation.showsPrintPanel = true
        printOperation.showsProgressPanel = true
        
        printOperation.run()
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
