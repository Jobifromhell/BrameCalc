import SwiftUI
import MapKit

struct ProjectDetailView: View {
    @ObservedObject var project: Project
    @State private var selectedTab: String = "Général"

    private let tabs = [
        ("Général", "doc.text"),
        ("Team", "person.3"),
        ("Distrib", "bolt"),
        ("CTS", "tent"),
        ("AV", "speaker.wave.2"),
        ("Déco", "paintbrush"),
        ("Plans", "map"),
        ("Photos", "camera")
    ]

    var body: some View {
        VStack {
            Spacer()

            switch selectedTab {
            case "Général":
                GeneralDetailsView(project: project)
            case "Team":
                TeamView()
            case "Distrib":
                DistribDetailsView(project: project)
            case "CTS":
                CTSDetailsView(project: project)
            case "AV":
                AVDetailsView(project: project)
            case "Déco":
                DecoDetailsView(project: project)
            case "Plans":
                PlansView(project: project)
            case "Photos":
                PhotosView(project: project)
            default:
                GeneralDetailsView(project: project)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabs, id: \.0) { tab in
                        Button(action: {
                            selectedTab = tab.0
                        }) {
                            VStack {
                                Image(systemName: tab.1)
                                    .font(.system(size: 24))
                                    .foregroundColor(selectedTab == tab.0 ? .blue : .gray)
                                Text(tab.0)
                                    .font(.caption)
                                    .foregroundColor(selectedTab == tab.0 ? .blue : .gray)
                            }
                            .frame(width: 80, height: 80)
                            .background(
                                selectedTab == tab.0 ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1)
                            )
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle(Text(project.name.isEmpty ? "Nouveau Projet" : project.name))
        .toolbar {
            ToolbarItem {
                Button("Sauvegarder") {
                    CloudKitManager.shared.saveProject(project) { result in
                        switch result {
                        case .success(let project):
                            print("Projet sauvegardé: \(project)")
                        case .failure(let error):
                            print("Erreur lors de la sauvegarde du projet: \(error)")
                        }
                    }
                }
            }
        }
    }
}


//struct ProjectDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDetailView(project: Project())
//    }
//}
