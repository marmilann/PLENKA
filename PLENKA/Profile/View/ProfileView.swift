//
//  ProfileView.swift
//  PLENKA
//
//  Created by Nariman on 12.07.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var openFollowers = false
    @State private var openFollowing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                    VStack {
                        Image("UserPhoto")
                            .resizable()
                            .frame(width: 150.0, height: 150)
                            .clipShape(Circle())
                            .padding(3)
                        
                        Text(TextContainment.userName.text)
                            .font(.system(size: 55.5, weight: .heavy))
                        Text(TextContainment.bio.text)
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
                            Text(TextContainment.post.text)
                                .font(.system(size: 28.5, weight: .medium))
                            NavigationLink(destination:FollowersView()) {
                                Text(TextContainment.followers.text)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 28.5, weight: .medium))
                            }
                            NavigationLink(destination:FollowersView()) {
                                Text(TextContainment.following.text)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 28.5, weight: .medium))
                            }
                        }
                        .padding(.leading, 30)
                        Spacer()
                        VStack(alignment: .center) {
                            Text("9")
                                .font(.system(size: 28.5, weight: .regular))
                            Text("10")
                                .font(.system(size: 28.5, weight: .regular))
                            Text("10")
                                .font(.system(size: 28.5, weight: .regular))
                        }
                        .padding(.trailing, 30)
                    }
                    .padding(.bottom, 20)
                VStack {
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
                            ForEach(0..<9) { index in
                                NavigationLink(destination: ProfilePostView()){
                                    Image("UserPost")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 135, height: 135)
                                        .clipped()
                                }
                            }
                        }
                    }
                }
                    .padding(.top, 485)
                    Divider()
                        .background(Color.black)
                        .padding(.top, 130)
                }
            }
        }
    }

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

