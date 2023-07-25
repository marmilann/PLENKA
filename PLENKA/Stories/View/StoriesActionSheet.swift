//
//  File.swift
//  PLENKA
//
//  Created by Nariman on 11.07.2023.
//

import Foundation
import SwiftUI

struct StoriesActionSheet: View {
    @Environment(\.colorScheme) var deviceColorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex = 0
    @State private var isLoading = true
    private let images = ["UserStories", "UserStories1", "UserStories2", "UserStories3"]
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView(selection: $currentIndex) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .tag(index)
                    }
                }
                .frame(width: 450, height: 1000)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                HStack {
                    Color.black.edgesIgnoringSafeArea([.trailing, .leading])
                        .opacity(0.7)
                }
                .frame(width: 610, height: 200)
                .padding(.bottom, 760)
                ZStack {
                    Image("InstaColor")
                        .resizable()
                        .frame(width: 76, height: 76)
                        .clipped()
                        .scaledToFit()
                        .padding(.horizontal, -2)
                        .clipShape(Circle())
                        .padding(.trailing, 300)
                        .padding(.top, 14)
                    NavigationLink(destination: ProfileView(viewModel: ProfileViewModel(profile: NVUser(id: "", name: "", bio: "")))){
                        Image("UserPhoto")
                            .resizable()
                            .frame(width: 66.0, height: 66)
                            .clipped()
                            .scaledToFit()
                            .padding(.horizontal, 20)
                            .clipShape(Circle())
                            .padding(.trailing, 300)
                            .padding(.top, 14)
                    }
                    VStack(alignment: .leading) {
                        Text("@" + TextContainment.userName.text)
                            .foregroundColor(deviceColorScheme == .light ? .white : .black)
                            .font(.system(size: 20, weight: .heavy))
                        Text(TextContainment.commentTime.text)
                            .foregroundColor(deviceColorScheme == .light ? .white : .black)
                            .font(.system(size: 11, weight: .light))
                    }
                    .padding(.top, 12)
                    .padding(.leading, -80)
                    HStack(spacing: 3) {
                        ForEach(0..<images.count, id: \.self) { index in
                            if index == currentIndex {
                                Color.white
                                    .frame(width: 30, height: 5)
                                    .cornerRadius(50)
                            } else {
                                Color.white
                                    .frame(width: 30, height: 5)
                                    .opacity(0.4)
                                    .cornerRadius(30)
                            }
                        }
                    }
                    .frame(width: 400, height: 10)
                    .padding(.top, 105)
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("leave")
                        }
                    }
                    .padding(.leading, 320)
                    .padding(.top, 4)
                }
                .padding(.top, -400)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
struct StoriesActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        StoriesActionSheet()
    }
}

