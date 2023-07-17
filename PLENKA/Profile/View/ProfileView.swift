//
//  ProfileView.swift
//  PLENKA
//
//  Created by Nariman on 12.07.2023.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("UserPhoto")
                    .resizable()
                    .frame(width: 150.0, height: 150)
                    .clipped()
                    .scaledToFit()
                    .cornerRadius(100)
                    .padding(3)
                
                Text("UserName")
                    .font(.system(size: 55.5, weight: .heavy))
                Text("Hello! I am a beginner photographer, I will be glad if you like my content !!!")
                    .font(.system(size: 20.5, weight: .regular))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.horizontal, 35)
            }
            .padding(.bottom, 450)
            
            Divider()
                .background(Color.black)
                .padding(.bottom, 130)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("post")
                        .font(.system(size: 28.5, weight: .medium))
                    Text("followers")
                        .font(.system(size: 28.5, weight: .medium))
                    Text("following")
                        .font(.system(size: 28.5, weight: .medium))
                }
                .padding(.leading, 30)
                Spacer()
                VStack(alignment: .center) {
                    Text("10")
                        .font(.system(size: 28.5, weight: .regular))
                    Text("1k")
                        .font(.system(size: 28.5, weight: .regular))
                    Text("16")
                        .font(.system(size: 28.5, weight: .regular))
                }
                .padding(.trailing, 30)
            }
            Divider()
                .background(Color.black)
                .padding(.top, 130)
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
