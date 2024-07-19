import SwiftUI

struct ProjectMenuView: View {
    @State private var selectedProject: Project?
    @State private var projects: [Project] = []
    @State private var folders: [ProjectFolder] = []
    @State private var isLoading = false
    @State private var searchText = ""
    @State private var sortAscending = true
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    TextField("Rechercher", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        sortAscending.toggle()
                        projects.sort {
                            sortAscending ? $0.eventDate < $1.eventDate : $1.eventDate < $0.eventDate
                        }
                    }) {
                        Label("Trier par date", systemImage: "arrow.up.arrow.down")
                    }
                    .padding()
                    .frame(width: 170)
                }
                
                List {
                    ForEach(filteredProjects) { project in
                        HStack {
                            Text(project.name)
                            Spacer()
                            Button(action: {
                                selectedProject = project
                            }) {
                                Text("Select")
                            }
                        }
                        .background(project.id == selectedProject?.id ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                        .onDrag {
                            return NSItemProvider(object: project.name as NSString)
                        }
                    }
                    .onDelete(perform: deleteProject)
                    
                    ForEach(folders) { folder in
                        Section(header: EditableText(text: folder.name, onCommit: { newName in
                            if let index = folders.firstIndex(where: { $0.id == folder.id }) {
                                folders[index].name = newName
                                saveProjectsLocally()
                            }
                        })) {
                            ForEach(folder.projects) { project in
                                HStack {
                                    Text(project.name)
                                    Spacer()
                                    Button(action: {
                                        selectedProject = project
                                    }) {
                                        Text("Select")
                                    }
                                }
                                .background(project.id == selectedProject?.id ? Color.blue.opacity(0.2) : Color.clear)
                                .cornerRadius(8)
                            }
                            .onDelete { indexSet in
                                deleteProjectFromFolder(at: indexSet, in: folder)
                            }
                            .onMove { indices, newOffset in
                                moveProject(indices: indices, newOffset: newOffset, in: folder)
                            }
                        }
                        .onDrop(of: ["public.text"], delegate: FolderDropDelegate(folder: folder, projects: $projects, folders: $folders))
                    }
                    .onMove { indices, newOffset in
                        moveFolder(indices: indices, to: newOffset)
                    }
                }
                .navigationTitle("Projets")
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
                            let newProject = Project()
                            projects.append(newProject)
                            selectedProject = newProject
                            saveProjectsLocally()
                            refreshProjects()
                        }) {
                            Label("Créer un projet", systemImage: "plus")
                        }
                    }
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
                            let newFolder = ProjectFolder(name: "Nouveau Dossier", projects: [])
                            folders.append(newFolder)
                            saveProjectsLocally()
                        }) {
                            Label("Créer un dossier", systemImage: "folder.badge.plus")
                        }
                    }
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
                            refreshProjects()
                        }) {
                            Label("Rafraîchir", systemImage: "arrow.clockwise")
                        }
                    }
                }
                .onAppear(perform: loadProjects)
                
                Spacer()
            }
            .frame(minWidth: 200, maxWidth: 300)
            
            VStack {
                if let project = selectedProject {
                    ProjectDetailView(project: project, loadProjects: loadProjects)
                        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
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
        .onChange(of: selectedProject) { newSelectedProject in
            print("Selected project changed to: \(String(describing: newSelectedProject?.name))")
        }
    }
    
    private var filteredProjects: [Project] {
        projects.filter {
            searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) || $0.description.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    private func saveProjectsLocally() {
        UserDefaultsHelper.shared.saveProjects(projects)
        UserDefaultsHelper.shared.saveFolders(folders)
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
        folders = UserDefaultsHelper.shared.loadFolders()
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
                refreshProjects()
            case .failure(let error):
                print("Error saving project: \(error)")
            }
        }
    }
    
    private func refreshProjects() {
        loadProjects()
    }
    
    private func deleteProject(at offsets: IndexSet) {
        offsets.map { projects[$0] }.forEach { project in
            CloudKitManager.shared.deleteProject(project) { result in
                switch result {
                case .success:
                    print("Project deleted successfully")
                case .failure(let error):
                    print("Error deleting project: \(error)")
                }
            }
        }
        projects.remove(atOffsets: offsets)
        saveProjectsLocally()
    }
    
    private func deleteProjectFromFolder(at offsets: IndexSet, in folder: ProjectFolder) {
        if let folderIndex = folders.firstIndex(where: { $0.id == folder.id }) {
            folders[folderIndex].projects.remove(atOffsets: offsets)
            saveProjectsLocally()
        }
    }
    
    private func moveProject(indices: IndexSet, newOffset: Int, in folder: ProjectFolder) {
        if let folderIndex = folders.firstIndex(where: { $0.id == folder.id }) {
            folders[folderIndex].projects.move(fromOffsets: indices, toOffset: newOffset)
            saveProjectsLocally()
        }
    }
    
    private func moveFolder(indices: IndexSet, to newOffset: Int) {
        folders.move(fromOffsets: indices, toOffset: newOffset)
        saveProjectsLocally()
    }
}

struct FolderDropDelegate: DropDelegate {
    let folder: ProjectFolder
    @Binding var projects: [Project]
    @Binding var folders: [ProjectFolder]
    
    func performDrop(info: DropInfo) -> Bool {
        guard let itemProvider = info.itemProviders(for: ["public.text"]).first else {
            return false
        }
        itemProvider.loadItem(forTypeIdentifier: "public.text", options: nil) { item, _ in
            DispatchQueue.main.async {
                if let projectName = item as? String {
                    if let projectIndex = self.projects.firstIndex(where: { $0.name == projectName }) {
                        let project = self.projects.remove(at: projectIndex)
                        if let folderIndex = self.folders.firstIndex(where: { $0.id == self.folder.id }) {
                            self.folders[folderIndex].projects.append(project)
                            UserDefaultsHelper.shared.saveProjects(self.projects)
                            UserDefaultsHelper.shared.saveFolders(self.folders)
                        }
                    }
                }
            }
        }
        return true
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
