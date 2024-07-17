import SwiftUI
import Sparkle

@main
struct BrameCalcApp: App {
    let persistenceController = PersistenceController.shared
//    @StateObject private var updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .environmentObject(updaterController)
                .onAppear {
                    checkForUpdates()
                }
        }
//        .commands {
//            CommandGroup(replacing: .appInfo) {
//                Button("Check for Updates...") {
//                    updaterController.checkForUpdates(nil)
//                }
//                .keyboardShortcut("u", modifiers: [.command, .option])
//            }
//        }
    }

    private func checkForUpdates() {
//        updaterController.checkForUpdatesInBackground()
    }
}
