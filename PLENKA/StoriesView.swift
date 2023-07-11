//
//  StoriesView.swift
//  PLENKA
//
//  Created by Nariman on 11.07.2023.
//

import Foundation
import SwiftUI


struct StoriesView: View {
    var body: some View {
        ZStack {
            
            Image ("InstaColor")
                .resizable()
                .frame(width: 71, height: 71)
                .clipped()
                .scaledToFit()
                .padding(.horizontal, 20)
                .clipShape(Circle())
            
            Image ("UserPhoto")
                .resizable()
                .frame(width: 66.0, height: 66)
                .clipped()
                .scaledToFit()
                .padding(.horizontal, 20)
                .clipShape(Circle())
        }
        .frame(width: 66.0, height: 66)
    }
}

