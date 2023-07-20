//
//  SwiftApp.swift
//  Swift
//
//  Created by H S Negi on 18/07/23.
//

import SwiftUI

@main
struct SwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
