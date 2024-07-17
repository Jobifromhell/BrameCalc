import SwiftUI

struct ProjectListView: View {
    @Binding var selectedProject: Project?
    @Binding var projects: [Project]

    var body: some View {
        List {
            ForEach(projects) { project in
                Button(action: {
                    selectedProject = project
                }) {
                    Text(project.name)
                }
            }
            .onDelete(perform: deleteProject)
        }
    }

    private func deleteProject(at offsets: IndexSet) {
        offsets.map { projects[$0] }.forEach { project in
            CloudKitManager.shared.deleteProject(project) { result in
                switch result {
                case .success:
                    print("Project deleted")
                case .failure(let error):
                    print("Error deleting project: \(error)")
                }
            }
        }
        projects.remove(atOffsets: offsets)
    }
}
