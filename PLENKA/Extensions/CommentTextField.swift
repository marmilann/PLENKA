//
//  Textfields++.swift
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
            Image("UserPhoto")
                .resizable()
                .frame(width: 25.0, height: 25)
                .cornerRadius(100)
                .padding(.leading, -7)
                .padding(.trailing, -7)
            Image(systemName: imageName)
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
        .frame(width: 220, height: 5)
                .padding()
                .foregroundColor(.textColor)
                .background(Color.background)
                .cornerRadius(60)
           
    }
}
