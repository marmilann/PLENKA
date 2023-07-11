//
//  File.swift
//  PLENKA
//
//  Created by Nariman on 11.07.2023.
//

import Foundation
import SwiftUI

struct StoriesActionSheet: View {
    var body: some View {
            ZStack {
                TabView {
                Image("UserPhoto")
                        .resizable()
                Image("UserPost")
                        .resizable()
                Image("UserPhoto")
                        .resizable()
                Image("UserPost")
                        .resizable()
            }
                
//                .frame(width: 350, height: 350)
                .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}
