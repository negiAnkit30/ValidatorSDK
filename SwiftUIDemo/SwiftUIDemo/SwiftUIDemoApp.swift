//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by H S Negi on 18/07/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
