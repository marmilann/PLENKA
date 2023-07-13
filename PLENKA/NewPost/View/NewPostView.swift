//
//  NewPostView.swift
//  PLENKA
//
//  Created by Nariman on 13.07.2023.
//

import SwiftUI

struct NewPostView: View {
    @State private var isShowPhotoLibrary = false
    @State private var addComment = ""
    var body: some View {
        ZStack {
            Color.lightShadow
            VStack {
                Button(action: {
                    isShowPhotoLibrary = true
                    print("Button tapped")
                }) {
                    Image("IconPlenka")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .padding(.bottom, 300)
                }
                .padding(.top, 230)
            }
            .frame(width: 400, height: 400)
            .padding(.bottom, 350)
            
            VStack {
                NeumorphicStyleTextField(textField: TextField("Add Comment...", text: $addComment), imageName: "")
                    .font(.system(size: 23))
                    .frame(width: 350, height: 100)
                
            }
        }
        
    }
    
    
    struct NewPostView_Previews: PreviewProvider {
        static var previews: some View {
            NewPostView()
        }
    }
}
