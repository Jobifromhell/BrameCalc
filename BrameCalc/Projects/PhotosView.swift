import SwiftUI
import Combine

struct IdentifiableURL: Identifiable {
    var id = UUID()
    var url: URL
}

struct PhotosView: View {
    @ObservedObject var project: Project
    @State private var selectedPhoto: IdentifiableURL?
    @State private var showAnnotations = true

    var body: some View {
        VStack {
            if project.photoURLs.isEmpty {
                Text("No photos available")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                        ForEach(project.photoURLs, id: \.self) { url in
                            if let image = NSImage(contentsOf: url) {
                                Image(nsImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .onTapGesture {
                                        selectedPhoto = IdentifiableURL(url: url)
                                    }
                            } else {
                                Text("Failed to load image")
                                    .foregroundColor(.red)
                                    .padding()
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle(project.name.isEmpty ? "Photos" : project.name)
        .sheet(item: $selectedPhoto) { identifiableURL in
            PhotoDetailView(photoURL: identifiableURL.url, showAnnotations: $showAnnotations)
        }
        .contextMenu {
            if let selectedPhoto = selectedPhoto {
                Button(action: {
                    removePhoto(url: selectedPhoto.url)
                }) {
                    Text("Delete Photo")
                    Image(systemName: "trash")
                }
            }
        }
    }

    private func removePhoto(url: URL) {
        if let index = project.photoURLs.firstIndex(of: url) {
            project.photoURLs.remove(at: index)
        }
    }
}

struct PhotoDetailView: View {
    var photoURL: URL
    @Binding var showAnnotations: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            if let image = NSImage(contentsOf: photoURL) {
                Image(nsImage: image)
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                Text("Failed to load image")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Toggle("Show Annotations", isOn: $showAnnotations)
                .padding()
            
//            HStack {
//                Button(action: {
//                    printPhoto()
//                }) {
//                    Label("Print", systemImage: "printer")
//                }
//                .padding()
                
//                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Label("Close", systemImage: "xmark")
                }
                .padding()
//            }
        }
    }
    
    private func printPhoto() {
        guard let image = NSImage(contentsOf: photoURL) else { return }
        
        let imageView = NSImageView(image: image)
        let printInfo = NSPrintInfo.shared
        let printOperation = NSPrintOperation(view: imageView)
        printOperation.printInfo = printInfo
        
        // Running the print operation on the main thread
        DispatchQueue.main.async {
            printOperation.run()
        }
    }
}
//struct PhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosView(project: Project())
//    }
//}
