//
//  PLENKAApp.swift
//  PLENKA
//
//  Created by Nariman on 25.06.2023.
//

import SwiftUI

@main
struct PLENKAApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Main()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
