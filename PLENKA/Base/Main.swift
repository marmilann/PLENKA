//
//  Main.swift
//  PLENKA
//
//  Created by Nariman on 12.07.2023.
//

import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Image("news")
                }
            
            NewPostView()
                .tabItem {
                    Image("camera")
                }
            
            ProfileView()
                .tabItem {
                    Image("profile")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
