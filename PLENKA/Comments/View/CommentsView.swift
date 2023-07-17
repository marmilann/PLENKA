//
//  CommentsView.swift
//  PLENKA
//
//  Created by Nariman on 13.07.2023.
//

import SwiftUI

struct CommentsView: View {
    @State private var likeTap = false
    var body: some View {
        HStack(alignment: .top) {
            Image("UserPhoto")
                .resizable()
                .frame(width: 45.0, height: 45)
                .clipped()
                .scaledToFit()
                .cornerRadius(100)
                .padding(3)
            VStack(alignment: .leading) {
                Text("ahtyam_10_")
                    .font(.system(size: 15.5, weight: .heavy))
                +
                Text("   3 hour ago")
                    .font(.system(size: 14, weight: .light))
                Text("my first comment")
                    .padding(.top, -5)
            }
            Button(action: {
                likeTap.toggle()
                print("Like")
            }) {
                Image(likeTap ? "likeTapped" : "like")
                    .resizable()
                    .padding(.bottom, 30)
                    .frame(width: 80, height: 90)
                    .padding(.leading, 100)
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
