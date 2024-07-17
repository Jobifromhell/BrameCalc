import SwiftUI

struct ProjectMenuView: View {
    @State private var selectedProject: Project?
    @State private var projects: [Project] = []
    @State private var isLoading = false
    
    var body: some View {
        HStack {
            VStack {
                ProjectListView(selectedProject: $selectedProject, projects: $projects)
                    .frame(minWidth: 200, maxWidth: 300)
                
                HStack {
                    Button(action: {
                        let newProject = Project()
                        projects.append(newProject)
                        selectedProject = newProject
                        saveProjectsLocally()
                    }) {
                        Label("Créer un projet", systemImage: "plus")
                    }
                    .padding()
                    
                    Button(action: {
                        refreshProjects()
                    }) {
                        Label("Rafraîchir", systemImage: "arrow.clockwise")
                    }
                    .padding()
                }
                
                Spacer()
            }
            
            VStack {
                if let project = selectedProject {
                    ProjectDetailView(project: project)
                        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
                    
                    Button(action: {
                        saveProject(project)
                    }) {
                        Label("Sauvegarder", systemImage: "square.and.arrow.down")
                    }
                    .padding()
                } else {
                    Text("Sélectionnez un projet")
                        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
                }
            }
            .frame(maxWidth: .infinity)
            
            if isLoading {
                VStack {
                    Spacer()
                    LoadingIndicator()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear(perform: loadProjects)
    }
    
    private func saveProjectsLocally() {
        UserDefaultsHelper.shared.saveProjects(projects)
    }
    
    private func loadProjects() {
        isLoading = true
        CloudKitManager.shared.fetchProjects { result in
            isLoading = false
            switch result {
            case .success(let projects):
                self.projects = projects
                saveProjectsLocally() // Save the fetched projects locally
            case .failure(let error):
                print("Error loading projects: \(error)")
            }
        }
    }
    
    private func saveProject(_ project: Project) {
        isLoading = true
        CloudKitManager.shared.saveProject(project) { result in
            isLoading = false
            switch result {
            case .success(let project):
                if let index = self.projects.firstIndex(where: { $0.id == project.id }) {
                    self.projects[index] = project
                } else {
                    self.projects.append(project)
                }
                saveProjectsLocally() // Save the projects locally
            case .failure(let error):
                print("Error saving project: \(error)")
            }
        }
    }
    
    private func refreshProjects() {
        loadProjects()
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

struct LoadingIndicator: View {
    @State private var isAnimating = false
    
    var body: some View {
        Image(systemName: "arrow.2.circlepath")
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear {
                self.isAnimating = true
            }
            .onDisappear {
                self.isAnimating = false
            }
    }
}
