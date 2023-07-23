//
//  PLENKAApp.swift
//  PLENKA
//
//  Created by Nariman on 25.06.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct PLENKAApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegete
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Authentication()
        }
    }
    class AppDelegete: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp .configure()
            
            return true
        }
    }
}

struct PLENKAApp_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
            .previewDevice("")
    }
}
