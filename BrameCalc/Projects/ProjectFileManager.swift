import Foundation

class FileManagerHelper {
    static let shared = FileManagerHelper()
    let projectDirectory: URL
    
    private init() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        projectDirectory = paths[0].appendingPathComponent("Projects")
        
        if !FileManager.default.fileExists(atPath: projectDirectory.path) {
            try? FileManager.default.createDirectory(at: projectDirectory, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    func saveProject(_ project: Project) {
        let fileURL = projectDirectory.appendingPathComponent("\(project.id).json")
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(project) {
            try? data.write(to: fileURL)
        }
    }
    
//    func loadProjects() -> [Project] {
//        var projects: [Project] = []
//        let decoder = JSONDecoder()
//        if let files = try? FileManager.default.contentsOfDirectory(atPath: projectDirectory.path) {
//            for file in files where file.hasSuffix(".json") {
//                let fileURL = projectDirectory.appendingPathComponent(file)
//                if let data = try? Data(contentsOf: fileURL),
//                   let project = try? decoder.decode(Project.self, from: data) {
//                    projects.append(project)
//                }
//            }
//        }
//        return projects
//    }
}
