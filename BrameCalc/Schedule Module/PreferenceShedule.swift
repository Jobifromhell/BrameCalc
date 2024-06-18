//import Foundation
//
//struct GeneralPreferences: Identifiable, Codable {
//    var id = UUID()
//    var stage1Name: String = ""
//    var stage2Name: String = ""
//    var stage3Name: String = ""
//    var breakBeforeFirstShow: String = ""
//    var changeoverTime: String = ""
//    var overlapShow: String = ""
//    var overlapSoundcheck: String = ""
//}
//
//import SwiftUI
//
//struct PreferencesView: View {
//    @State private var preferences = GeneralPreferences()
//    @State private var projectNames: [String] = []
//    @State private var selectedProject: String = ""
//
//    var body: some View {
//        VStack {
//            Form {
//                Section(header: Text("Noms des Scènes")) {
//                    TextField("Scène 1", text: $preferences.stage1Name)
//                    TextField("Scène 2", text: $preferences.stage2Name)
//                    TextField("Scène 3", text: $preferences.stage3Name)
//                }
//
//                Section(header: Text("Durations")) {
//                    Picker("Pause avant le premier spectacle", selection: $preferences.breakBeforeFirstShow) {
//                        ForEach(generateBreakDurations(), id: \.self) { duration in
//                            Text(duration)
//                        }
//                    }
//                    Picker("Temps de changement", selection: $preferences.changeoverTime) {
//                        ForEach(generateChangeoverDurations(), id: \.self) { duration in
//                            Text(duration)
//                        }
//                    }
//                }
//
//                Section(header: Text("Chevauchements")) {
//                    Picker("Chevauchement de spectacles", selection: $preferences.overlapShow) {
//                        ForEach(["Aucun", "Tous", "Scènes 1&2", "Scènes 1&3", "Scènes 2&3"], id: \.self) { option in
//                            Text(option)
//                        }
//                    }
//                    Picker("Chevauchement de soundchecks", selection: $preferences.overlapSoundcheck) {
//                        ForEach(["Aucun", "Tous", "Avec Show", "Avec Soundcheck"], id: \.self) { option in
//                            Text(option)
//                        }
//                    }
//                }
//
//                Section(header: Text("Projets")) {
//                    Picker("Projets", selection: $selectedProject) {
//                        ForEach(projectNames, id: \.self) { project in
//                            Text(project)
//                        }
//                    }
//                }
//            }
//            
//            HStack {
//                Button("Supprimer Projet") {
//                    deleteSelectedProject()
//                }
//                .padding()
//                
//                Button("Enregistrer") {
//                    savePreferences()
//                }
//                .padding()
//                
//                Button("Envoyer Feedback") {
//                    sendFeedback()
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
//        if let data = UserDefaults.standard.data(forKey: "GeneralPreferences"),
//           let loadedPreferences = try? JSONDecoder().decode(GeneralPreferences.self, from: data) {
//            preferences = loadedPreferences
//        }
//        loadProjectsList()
//    }
//    
//    func savePreferences() {
//        // Sauvegarder les préférences dans UserDefaults ou un autre stockage persistant
//        if let data = try? JSONEncoder().encode(preferences) {
//            UserDefaults.standard.set(data, forKey: "GeneralPreferences")
//        }
//        
//        // Envoyer une notification que les préférences ont été mises à jour
//        let updatedPreferences: [String: String] = [
//            "BreakBeforeFirstShow": preferences.breakBeforeFirstShow,
//            "ChangeoverTime": preferences.changeoverTime,
//            "OverlapShow": preferences.overlapShow,
//            "OverlapSoundcheck": preferences.overlapSoundcheck
//        ]
//        NotificationCenter.default.post(name: NSNotification.Name("PreferencesUpdated"), object: nil, userInfo: updatedPreferences)
//        
//        // Fermer la fenêtre de préférences
//        // Vous devez gérer la fermeture de la vue dans l'application SwiftUI
//    }
//    
//    func loadProjectsList() {
//        let fileManager = FileManager.default
//        let documentsDirectory = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        
//        do {
//            let fileURLs = try fileManager.contentsOfDirectory(at: documentsDirectory!, includingPropertiesForKeys: nil)
//            projectNames = fileURLs.filter { $0.pathExtension == "plist" }.map { $0.deletingPathExtension().lastPathComponent }
//        } catch {
//            print("Error while enumerating files \(documentsDirectory?.path ?? ""): \(error.localizedDescription)")
//        }
//    }
//    
//    func deleteSelectedProject() {
//        let selectedProjectName = selectedProject
//        
//        if selectedProjectName.isEmpty {
//            return
//        }
//        
//        let fileManager = FileManager.default
//        let documentsDirectory = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        
//        if let projectURL = documentsDirectory?.appendingPathComponent("\(selectedProjectName).plist") {
//            do {
//                try fileManager.removeItem(at: projectURL)
//                print("Project deleted successfully.")
//                
//                // Actualiser la liste des projets après l'effacement
//                loadProjectsList()
//            } catch {
//                print("Failed to delete project: \(error)")
//            }
//        }
//        NotificationCenter.default.post(name: NSNotification.Name("ProjectDeleted"), object: nil)
//    }
//    
//    func generateBreakDurations() -> [String] {
//        var durations: [String] = []
//        for hour in 0...3 {
//            for minute in stride(from: 0, to: 60, by: 10) {
//                let durationString = String(format: "%02d:%02d", hour, minute)
//                durations.append(durationString)
//            }
//        }
//        return durations
//    }
//    
//    func generateChangeoverDurations() -> [String] {
//        var durations: [String] = []
//        for minute in stride(from: 0, to: 60, by: 5) {
//            let durationString = String(format: "00:%02d", minute)
//            durations.append(durationString)
//        }
//        return durations
//    }
//    
//    func sendFeedback() {
//        let email = "olivier.jobin@hotmail.fr"
//        let subject = "Feedback utilisateur pour l'application Planning Maker"
//        let body = "Écrivez votre feedback ici..."
//        
//        let urlString = "mailto:\(email)?subject=\(subject)&body=\(body)"
//        if let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") {
//            NSWorkspace.shared.open(url)
//        }
//    }
//}
//
//struct PreferencesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreferencesView()
//    }
//}
