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
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("News")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
