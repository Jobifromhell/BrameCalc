//
//import SwiftUI
//
//struct ProjectMenuView: View {
//    @State private var isCreatingProject = false
//    @State private var isSelectingProject = false
//    @State private var selectedProject: Project?
//    @State private var projects = FileManagerHelper.shared.loadProjects()
//    
//    var body: some View {
//        HStack {
//            VStack {
//                Text("Event Planner")
//                    .font(.largeTitle)
//                    .padding()
//                
//                Button(action: {
//                    isCreatingProject = true
//                    selectedProject = Project()
//                }) {
//                    Text("Créer un projet")
//                        .font(.headline)
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                
//                List {
//                    ForEach(projects) { project in
//                        Button(action: {
//                            selectedProject = project
//                        }) {
//                            Text(project.name)
//                        }
//                    }
//                    .onDelete(perform: deleteProject)
//                }
//                .padding(.top)
//                
//                Spacer()
//            }
//            .padding()
//            .frame(minWidth: 200)
//            
//            Divider()
//            
//            if let selectedProject = selectedProject {
//                VStack {
//                    HStack {
//                        Text("Onglets de Sélection")
//                        Picker("", selection: $selectedTab) {
//                            Text("Général").tag(0)
//                            Text("Accès").tag(1)
//                            Text("Électricité").tag(2)
//                            Text("Son").tag(3)
//                            Text("Lumière").tag(4)
//                            Text("Vidéo").tag(5)
//                            Text("Tente").tag(6)
//                            Text("Structure").tag(7)
//                            Text("Animation").tag(8)
//                            Text("Techniciens").tag(9)
//                        }
//                        .pickerStyle(SegmentedPickerStyle())
//                    }
//                    .padding()
//
//                    if selectedTab == 0 {
//                        ProjectDetailView(project: selectedProject)
//                    } else {
//                        TabDetailView(selectedTab: $selectedTab, project: selectedProject)
//                    }
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            } else {
//                Text("Sélectionnez un projet ou créez-en un nouveau.")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//        }
//    }
//    
//    private func deleteProject(at offsets: IndexSet) {
//        offsets.map { projects[$0] }.forEach { project in
//            let fileURL = FileManagerHelper.shared.projectDirectory.appendingPathComponent("\(project.id).json")
//            try? FileManager.default.removeItem(at: fileURL)
//        }
//        projects.remove(atOffsets: offsets)
//    }
//}
//
//struct ProjectMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectMenuView()
//    }
//}
