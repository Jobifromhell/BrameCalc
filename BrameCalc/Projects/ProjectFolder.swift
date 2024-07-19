import Foundation

class ProjectFolder: Identifiable, Codable {
    let id: UUID
    var name: String
    var projects: [Project]

    init(name: String, projects: [Project]) {
        self.id = UUID()
        self.name = name
        self.projects = projects
    }
}
