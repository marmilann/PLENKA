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
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        Image("UserPhoto")
                            .resizable()
                            .frame(width: 150.0, height: 150)
                            .clipShape(Circle())
                            .padding(3)
                        
                        TextField("User Name", text: $viewModel.profile.name)
                            .font(.system(size: 55.5, weight: .heavy))
                        TextField("Your Bio", text: $viewModel.profile.bio)
                            .font(.system(size: 20.5, weight: .regular))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .padding(.horizontal, 35)
                        
                    }
                    
                    Divider()
                        .background(Color.black)
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
                            Text("12")
                                .font(.system(size: 28.5, weight: .regular))
                            Text("10")
                                .font(.system(size: 28.5, weight: .regular))
                            Text("10")
                                .font(.system(size: 28.5, weight: .regular))
                        }
                        .padding(.trailing, 30)
                    }
                    .padding(.bottom, 20)
                    
                    Divider()
                        .background(Color.black)
                        .padding(.top, -10)
                    
                    VStack {
                        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
                            ForEach(0..<15) { index in
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
            }
        }
        .onSubmit {
            viewModel.setProfile()
        }
        .onAppear {
            self.viewModel.getProfile()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: NVUser(id: "",
                                                     name: "Ahtyam",
                                                    bio: "i am cool")))
    }
}

