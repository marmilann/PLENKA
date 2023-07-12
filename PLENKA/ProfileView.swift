//
//  ProfileView.swift
//  PLENKA
//
//  Created by Nariman Vildanov on 12.07.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var isShowingFollowers = false
    @State private var isShowingFollowing = false
    var name = ["1", "2", "2", "4", "5","1", "2", "3", "4", "5","1", "2", "3", "4", "5","1", "2", "3", "4", "5","1", "2", "3", "4", "5","1", "2", "3", "4", "5","1", "2", "3", "4", "5","1", "2", "3", "4", "5",]
    
    var body: some View {
        VStack {
            ZStack {
                Image("UserPhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(.top, 16)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                        }) {
                            Image(systemName: "camera")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.gray.opacity(0.8))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            
            Text("John Doe")
                .font(.title)
                .padding(.top, 8)
            
            Text("@johndoe")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 4)
            
            HStack {
                Spacer()
                
                VStack {
                    Text("Posts")
                        .font(.headline)
                    Text("100")
                        .font(.subheadline)
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        self.isShowingFollowers.toggle()
                    }) {
                        Text("Followers")
                            .font(.headline)
                        Text("1K")
                            .font(.subheadline)
                    }
                    .foregroundColor(.primary)
                    .sheet(isPresented: $isShowingFollowers) {
                        // Экран подписчиков
                        Text("Followers")
                    }
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        self.isShowingFollowing.toggle()
                    }) {
                        Text("Following")
                            .font(.headline)
                        Text("500")
                            .font(.subheadline)
                    }
                    .foregroundColor(.primary)
                    .sheet(isPresented: $isShowingFollowing) {
                        ScrollView {
                            VStack {
                                Text("Following:")
                                    .font(.system(size: 23.5, weight: .bold))
                                Divider()
                            }
                            ForEach(name, id: \.self) { name in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image("UserPhoto")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .cornerRadius(100)
                                        Text(name)
                                    }
                                    Divider()
                                }
                            }
                        }
                        .padding(10)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 16)
            
            Button(action: {
                // Действия при нажатии на кнопку редактирования профиля
            }) {
                Text("Edit Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.top, 16)
            }
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .animation(.default)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
