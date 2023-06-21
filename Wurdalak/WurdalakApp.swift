//
//  WurdalakApp.swift
//  Wurdalak
//
//  Created by Nariman on 21.06.2023.
//

import SwiftUI

@main
struct WurdalakApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
