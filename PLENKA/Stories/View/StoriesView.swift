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
            Image("InstaColor")
                .resizable()
                .frame(width: 76, height: 76)
                .clipped()
                .scaledToFit()
                .padding(.horizontal, 20)
                .clipShape(Circle())
            Button {
                openStories.toggle()
            } label: {
                Image("UserPhoto")
                    .resizable()
                    .frame(width: 70.0, height: 70)
                    .clipped()
                    .scaledToFit()
                    .padding(.horizontal, 20)
                    .clipShape(Circle())
            }
            .fullScreenCover(isPresented: $openStories, content: StoriesActionSheet.init)
        }
        .frame(width: 90.0, height: 90)
    }
}

