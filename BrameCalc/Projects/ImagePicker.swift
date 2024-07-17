import SwiftUI
import AppKit

struct ImagePicker: NSViewControllerRepresentable {
    @Binding var image: NSImage?

    class Coordinator: NSObject, NSOpenSavePanelDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func panel(_ sender: Any, didChangeToDirectoryURL url: URL?) {
            // Handle directory change if needed
        }

        func panel(_ sender: Any, didSelect url: URL?) {
            if let url = url, let nsImage = NSImage(contentsOf: url) {
                parent.image = nsImage
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeNSViewController(context: Context) -> NSViewController {
        let viewController = NSViewController()
        let panel = NSOpenPanel()
        panel.canChooseFiles = true
        panel.allowedFileTypes = ["png", "jpg", "jpeg"]
        panel.delegate = context.coordinator as? any NSOpenSavePanelDelegate
        panel.begin { response in
            if response == .OK {
                context.coordinator.panel(panel, didSelect: panel.url)
            }
        }
        return viewController
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}
}
