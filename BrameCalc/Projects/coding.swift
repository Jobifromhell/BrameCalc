//VStack {
//    HStack {
//        TextField("Rechercher", text: $searchText)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//        
//        Button(action: {
//            sortAscending.toggle()
//            projects.sort {
//                sortAscending ? $0.setupDate < $1.eventDate : $0.eventDate > $1.eventDate
//            }
//        }) {
//            Label("Trier par date", systemImage: "arrow.up.arrow.down")
//        }
//        .padding()
//        .frame(width: 170)
//        
//    }
//    
//    List {
//        ForEach(filteredProjects) { project in
//            HStack {
//                Text(project.name)
//                Spacer()
//                Button(action: {
//                    selectedProject = project
//                }) {
//                    Text("Select")
//                }
//            }
//            .onDrag {
//                return NSItemProvider(object: project.name as NSString)
//            }
//        }
//        .onDelete(perform: deleteProject)
//        
//        ForEach(folders) { folder in
//            Section(header: EditableText(text: folder.name, onCommit: { newName in
//                if let index = folders.firstIndex(where: { $0.id == folder.id }) {
//                    folders[index].name = newName
//                    saveProjectsLocally()
//                }
//            })) {
//                ForEach(folder.projects) { project in
//                    HStack {
//                        Text(project.name)
//                        Spacer()
//                        Button(action: {
//                            selectedProject = project
//                        }) {
//                            Text("Select")
//                        }
//                    }
//                }
//                .onDelete { indexSet in
//                    deleteProjectFromFolder(at: indexSet, in: folder)
//                }
//                .onMove { indices, newOffset in
//                    moveProject(indices: indices, newOffset: newOffset, in: folder)
//                }
//            }
//            .onDrop(of: ["public.text"], delegate: FolderDropDelegate(folder: folder, projects: $projects, folders: $folders))
//        }
//        .onMove { indices, newOffset in
//            moveFolder(indices: indices, to: newOffset)
//        }
//    }
//    .navigationTitle("Projets")
//    
//    .toolbar {
//        ToolbarItem(placement: .automatic) {
//            Button(action: {
//                let newProject = Project()
//                projects.append(newProject)
//                selectedProject = newProject
//                saveProjectsLocally()
//                refreshProjects()
//            }) {
//                Label("Créer un projet", systemImage: "plus")
//            }
//        }
//        ToolbarItem(placement: .automatic) {
//            Button(action: {
//                let newFolder = ProjectFolder(name: "Nouveau Dossier", projects: [])
//                folders.append(newFolder)
//                saveProjectsLocally()
//            }) {
//                Label("Créer un dossier", systemImage: "folder.badge.plus")
//            }
//        }
//        ToolbarItem(placement: .automatic) {
//            Button(action: {
//                refreshProjects()
//            }) {
//                Label("Rafraîchir", systemImage: "arrow.clockwise")
//            }
//        }
//    }
//    .onAppear(perform: loadProjects)
//    
//    Spacer()
//}
