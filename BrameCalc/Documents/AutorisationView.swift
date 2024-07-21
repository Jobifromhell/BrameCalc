import SwiftUI
//import QuickLook

// Extension to make URL conform to Identifiable
extension URL: Identifiable {
    public var id: URL { self }
}

struct DocumentsView: View {
    @State private var previewFileURL: URL?

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Documents Usuels")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            List {
                Section(header: Text("Circulation")) {
                    DownloadButton(title: "Autorisation de Circulation MERCEDES CP-704-HR", fileName: "AUTORISATION PL MERCEDES CP-704-HR.pdf", previewFileURL: $previewFileURL)
                    DownloadButton(title: "Autorisation de Circulation RENAULT BT-118-ZN", fileName: "AUTORISATION PL RENAULT BT-118-ZN.pdf", previewFileURL: $previewFileURL)
                }
                
                Section(header: Text("Congés")) {
                    DownloadButton(title: "Demande de congés", fileName: "FORMULAIRE GROUPE BRAME CP - RTT - RC.pdf", previewFileURL: $previewFileURL)
                }
                
                Section(header: Text("Attestation de bon montage")) {
                    DownloadButton(title: "Attestation de bon montage HYDRAU IV", fileName: "ATTESTATION DE BON MONTAGE HYDRAUIV.pdf", previewFileURL: $previewFileURL)
                }
            }
            .padding()
        }
//        .sheet(item: $previewFileURL) { url in
//            QuickLookPreview(url: url)
//        }
    }
}

struct DownloadButton: View {
    let title: String
    let fileName: String
    @Binding var previewFileURL: URL?

    var body: some View {
        HStack {
            Text(title)
            Spacer()
//            Button(action: {
//                previewFile()
//            }) {
//                Label("Prévisualiser", systemImage: "eye")
//            }
            Button(action: {
                downloadFile(named: fileName)
            }) {
                Label("Télécharger", systemImage: "arrow.down.circle")
            }
        }
    }

    private func previewFile() {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            print("Erreur : Fichier \(fileName) non trouvé.")
            return
        }
        previewFileURL = fileURL
    }

    private func downloadFile(named fileName: String) {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            print("Erreur : Fichier \(fileName) non trouvé.")
            return
        }

        let savePanel = NSSavePanel()
        savePanel.nameFieldStringValue = fileName
        savePanel.prompt = "Enregistrer"

        savePanel.begin { response in
            if response == .OK {
                guard let destinationURL = savePanel.url else { return }
                do {
                    try FileManager.default.copyItem(at: fileURL, to: destinationURL)
                    print("Fichier téléchargé avec succès : \(destinationURL)")
                } catch {
                    print("Erreur lors du téléchargement du fichier : \(error.localizedDescription)")
                }
            }
        }
    }
}

//struct QuickLookPreview: NSViewControllerRepresentable {
//    let url: URL
//
//    func makeNSViewController(context: Context) -> QLPreviewController {
//        let controller = QLPreviewController()
//        controller.dataSource = context.coordinator
//        return controller
//    }
//
//    func updateNSViewController(_ nsViewController: QLPreviewController, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(url: url)
//    }
//
//    class Coordinator: NSObject, QLPreviewControllerDataSource {
//        let url: URL
//
//        init(url: URL) {
//            self.url = url
//        }
//
//        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
//            return 1
//        }
//
//        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
//            return url as QLPreviewItem
//        }
//    }
//}
//
//struct DocumentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentsView()
//    }
//}
