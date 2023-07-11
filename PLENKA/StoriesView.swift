//
//  StoriesView.swift
//  PLENKA
//
//  Created by Nariman on 11.07.2023.
//

import Foundation
import SwiftUI


struct StoriesView: View {
    @State var openStories: Bool = false
    
    var body: some View {
        ZStack {
            
            Image ("InstaColor")
                .resizable()
                .frame(width: 71, height: 71)
                .clipped()
                .scaledToFit()
                .padding(.horizontal, 20)
                .clipShape(Circle())
            Button {
                openStories.toggle()
            } label: {
                Image("UserPhoto")
                    .resizable()
                    .frame(width: 66.0, height: 66)
                    .clipped()
                    .scaledToFit()
                    .padding(.horizontal, 20)
                    .clipShape(Circle())
            }
            .sheet(isPresented: $openStories) {
                StoriesActionSheet()
            }
        }
        .frame(width: 80.0, height: 80)
    }
}

