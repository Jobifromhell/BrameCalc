//import Foundation
//
//struct FestivalPreferences: Identifiable, Codable {
//    var id = UUID()
//    var name: String = ""
//    var venue: String = ""
//    var address: String = ""
//    var date: String = ""
//    var generalManagerName: String = ""
//    var generalManagerPhone: String = ""
//    var generalManagerEmail: String = ""
//    var stageManagerName: String = ""
//    var stageManagerPhone: String = ""
//    var stageManagerEmail: String = ""
//    var soundManagerName: String = ""
//    var soundManagerPhone: String = ""
//    var soundManagerEmail: String = ""
//    var lightManagerName: String = ""
//    var lightManagerPhone: String = ""
//    var lightManagerEmail: String = ""
//    var backlineName: String = ""
//    var backlinePhone: String = ""
//    var backlineEmail: String = ""
//}
//
//class ProjectManager: ObservableObject {
//    static let shared = ProjectManager()
//    @Published var projects: [Project] = []
//    
//    func saveProject(_ project: Project) {
//        // Sauvegarder le projet (par exemple, dans UserDefaults ou un fichier)
//        projects.append(project)
//    }
//}
//
//struct Project: Identifiable, Codable {
//    var id = UUID()
//    var festivalPreferences: FestivalPreferences
//}
//
//struct PreferencesFestivalView: View {
//    @State private var preferences = FestivalPreferences()
//    
//    var body: some View {
//        VStack {
//            Form {
//                Section(header: Text("Festival")) {
//                    TextField("Nom du festival", text: $preferences.name)
//                    TextField("Lieu", text: $preferences.venue)
//                    TextField("Adresse", text: $preferences.address)
//                    TextField("Date", text: $preferences.date)
//                }
//                
//                Section(header: Text("Gestionnaire Général")) {
//                    TextField("Nom", text: $preferences.generalManagerName)
//                    TextField("Téléphone", text: $preferences.generalManagerPhone)
//                    TextField("Email", text: $preferences.generalManagerEmail)
//                }
//                
//                Section(header: Text("Gestionnaire de Scène")) {
//                    TextField("Nom", text: $preferences.stageManagerName)
//                    TextField("Téléphone", text: $preferences.stageManagerPhone)
//                    TextField("Email", text: $preferences.stageManagerEmail)
//                }
//                
//                Section(header: Text("Gestionnaire du Son")) {
//                    TextField("Nom", text: $preferences.soundManagerName)
//                    TextField("Téléphone", text: $preferences.soundManagerPhone)
//                    TextField("Email", text: $preferences.soundManagerEmail)
//                }
//                
//                Section(header: Text("Gestionnaire des Lumières")) {
//                    TextField("Nom", text: $preferences.lightManagerName)
//                    TextField("Téléphone", text: $preferences.lightManagerPhone)
//                    TextField("Email", text: $preferences.lightManagerEmail)
//                }
//                
//                Section(header: Text("Backline")) {
//                    TextField("Nom", text: $preferences.backlineName)
//                    TextField("Téléphone", text: $preferences.backlinePhone)
//                    TextField("Email", text: $preferences.backlineEmail)
//                }
//            }
//            
//            HStack {
//                Button("Annuler") {
//                    // Fermer la fenêtre sans sauvegarder
//                }
//                .padding()
//                
//                Button("Enregistrer") {
//                    savePreferences()
//                    // Fermer la fenêtre après la sauvegarde
//                }
//                .padding()
//            }
//        }
//        .padding()
//        .onAppear(perform: loadPreferences)
//    }
//    
//    func loadPreferences() {
//        // Charger les préférences à partir de UserDefaults ou d'un autre stockage persistant
//        if let data = UserDefaults.standard.data(forKey: "FestivalPreferences"),
//           let loadedPreferences = try? JSONDecoder().decode(FestivalPreferences.self, from: data) {
//            preferences = loadedPreferences
//        }
//    }
//    
//    func savePreferences() {
//        // Sauvegarder les préférences dans UserDefaults ou un autre stockage persistant
//        if let data = try? JSONEncoder().encode(preferences) {
//            UserDefaults.standard.set(data, forKey: "FestivalPreferences")
//        }
//        
//        // Créer un nouveau projet avec les préférences du festival
//        let project = Project(festivalPreferences: preferences)
//        
//        // Sauvegarder le projet
//        ProjectManager.shared.saveProject(project)
//    }
//}
//
//
