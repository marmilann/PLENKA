//
//  NewPostView.swift
//  PLENKA
//
//  Created by Nariman on 13.07.2023.
//

import SwiftUI

struct NewPostView: View {
    @State public var isShowPhotoLibrary = false
    @State public var addComment = ""
   
   
    
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
                        .frame(width: 300, height: 170)
                        .padding(-40)
                        .padding(.bottom, 25)
                    
                }
            }
            .frame(width: 400, height: 400)
            .padding(.bottom, 350)
            
            
            VStack {
                NewPostTextField(textField: TextField("Add Comment...", text: $addComment), imageName: "")
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
