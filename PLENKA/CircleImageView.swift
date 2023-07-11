//
//  CircleImageView.swift
//  PLENKA
//
//  Created by Nariman on 27.06.2023.
//

import Foundation
import SwiftUI

struct CircledImageView: View {
    var imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
            Image("UserPhoto")
                .resizable()
                .frame(width: 30.0, height: 30)
                .clipped()
                .scaledToFit()
                .cornerRadius(100)
                .padding(3)
        }
        .frame(width: 40.0, height: 40)
    }
}

