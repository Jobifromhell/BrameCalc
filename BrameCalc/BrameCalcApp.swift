//
//  BrameCalcApp.swift
//  BrameCalc
//
//  Created by Olivier Jobin on 15/06/2024.
//

import SwiftUI

@main
struct BrameCalcApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
