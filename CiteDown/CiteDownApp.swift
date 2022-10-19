//
//  CiteDownApp.swift
//  CiteDown
//
//  Created by Jason Abbott on 10/19/22.
//

import SwiftUI

@main
struct CiteDownApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}