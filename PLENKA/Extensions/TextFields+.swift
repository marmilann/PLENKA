//
//  TextFields+.swift
//  PLENKA
//
//  Created by Nariman on 17.07.2023.
//

import SwiftUI

struct CommentTextField: View {
    @State private var openComments = false
    var textField: TextField<Text>
    var imageName: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 25.0, height: 25)
                .cornerRadius(100)
                .padding(.leading, -7)
                .padding(.trailing, -7)
                .foregroundColor(.lightShadow)
            textField
            
            Button {
                openComments.toggle()
            } label: {
                Image("IconSendComment")
                    .resizable()
                    .frame(width: 22.0, height: 22)
            }
        }
        .sheet(isPresented: $openComments) {
            CommentsSheet()
        }
        
        .frame(width: 250, height: 35)
        .padding()
        .foregroundColor(.textColor)
        .background(Color.background)
        .cornerRadius(60)
        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
        .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
        .padding(.top, 35)
    }
}

struct NewPostTextField: View {
    @State private var openComments = false
    var textField: TextField<Text>
    var imageName: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 35.0, height: 35)
                .clipped()
                .scaledToFit()
                .cornerRadius(100)
                .padding(3)
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
