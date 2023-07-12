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
                Image("UserStories")
                    .resizable()
                Image("UserStories1")
                    .resizable()
                Image("UserStories2")
                    .resizable()
                Image("UserStories3")
                    .resizable()
            }
            .frame(width: 450, height: 980)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)

            ZStack {
                Image("UserPhoto")
                    .resizable()
                    .frame(width: 66.0, height: 66)
                    .clipped()
                    .scaledToFit()
                    .padding(.horizontal, 20)
                    .clipShape(Circle())
                    .padding(.trailing, 350)
                VStack {
                    Text(" UserName").foregroundColor(.white).font(.system(size: 14.5, weight: .heavy))
                    Text("1 hour ago").foregroundColor(.white).font(.system(size: 14.5, weight: .medium))
                }
                .padding(.leading, -130)
            }
            .padding(.top, -400)
        }
    }
}

