//
//  KomApp.swift
//  Kom
//
//  Created by Александр Уфимцев on 13/12/2024.
//

import SwiftUI

@main
struct KomApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
