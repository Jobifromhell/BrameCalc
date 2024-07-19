import Foundation

class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()

    private let projectsKey = "projects"
    private let foldersKey = "folders"

    func saveProjects(_ projects: [Project]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(projects) {
            UserDefaults.standard.set(encoded, forKey: projectsKey)
        }
    }

    func loadProjects() -> [Project] {
        if let savedProjects = UserDefaults.standard.data(forKey: projectsKey) {
            let decoder = JSONDecoder()
            if let loadedProjects = try? decoder.decode([Project].self, from: savedProjects) {
                return loadedProjects
            }
        }
        return []
    }

    func saveFolders(_ folders: [ProjectFolder]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(folders) {
            UserDefaults.standard.set(encoded, forKey: foldersKey)
        }
    }

    func loadFolders() -> [ProjectFolder] {
            guard let data = UserDefaults.standard.array(forKey: foldersKey) as? [Data] else { return [] }
            return data.compactMap { try? JSONDecoder().decode(ProjectFolder.self, from: $0) }
        }
}
