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
            CustomTabBar(selectedTab: .home, allCases: CustomTabBarItem.allCases)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct PLENKAApp_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .previewDevice("")
    }
}
