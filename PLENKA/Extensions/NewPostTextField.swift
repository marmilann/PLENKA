//
//  TextFields+.swift
//  PLENKA
//
//  Created by Nariman on 13.07.2023.
//

import Foundation
import SwiftUI



struct NewPostTextField: View {
    @State private var openComments = false
    var textField: TextField<Text>
    var imageName: String
    var body: some View {
        HStack {
            Image("UserPhoto")
                .resizable()
                .frame(width: 35.0, height: 35)
                .clipped()
                .scaledToFit()
                .cornerRadius(100)
                .padding(3)
            Image(systemName: imageName)
                .foregroundColor(.darkShadow)
            textField
            
            Button {
                openComments.toggle()
            } label: {
                Image("IconSendComment")
                    .resizable()
                    .frame(width: 27.0, height: 27)
                    .clipped()
                    .scaledToFit()
                    .padding(.leading)
            }
        }
        .sheet(isPresented: $openComments) {
            CommentsSheet()
        }
                .padding()
                .foregroundColor(.textColor)
                .background(Color.background)
                .cornerRadius(60)
                .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
    }
}
