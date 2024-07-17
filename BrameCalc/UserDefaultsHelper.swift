import Foundation

class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    
    private let projectsKey = "savedProjects"
    
    private init() {}
    
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
}
