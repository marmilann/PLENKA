//
//  ContentView.swift
//  PLENKA
//
//  Created by Nariman on 25.06.2023.
//

import SwiftUI

struct MainScreen: View {
    @State private var isShowPhotoLibrary = false
    @State private var likeTap = false
    
    
    var photos: [String] = ["UserPhoto"]
    
    var body: some View {
        ZStack {
            ScrollView {
                HStack {
                    Image("IconPlenkaInscription")
                        .resizable()
                        .frame(width: 200.0, height: 55.5)
                    Spacer()
                    Button {
                        self.isShowPhotoLibrary = true
                        print("Button tapped")
                    } label: {
                        Image("IconNewPhotoAndVideo")
                            .resizable()
                            .frame(width: 55.0, height: 55.5)
                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 25)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        StoriesView()
                        StoriesView()
                        StoriesView()
                        StoriesView()
                        StoriesView()
                    }
                }
                .scrollIndicators(.hidden)
                Divider()
                    .background(Color.black)
                    .padding(.top, 10)
                    
                HStack {
                    Image("UserPhoto")
                        .resizable()
                        .frame(width: 60.0, height: 60)
                        .clipped()
                        .scaledToFit()
                        .cornerRadius(100)
                        .padding(.horizontal, 20)
                    VStack(alignment: .leading) {
                        Text("UserName")
                            .font(.system(size: 13.5, weight: .medium))
                        Text("UserLocation")
                            .font(.system(size: 11.5, weight: .regular))
                    }
                    Spacer()
                }
                .padding(.top, 30)
                
                ZStack {
                    TabView {
                        Image("UserPost")
                            .resizable()
                        Image("UserPost")
                            .resizable()
                    }
                    .frame(width: 350, height: 350)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                HStack {
                    Button(action: {
                        likeTap.toggle()
                        print("Like")
                    }) {
                        Image(likeTap ? "IconLikeColor" : "IconLike")
                            .resizable()
                            .frame(width: 35.0, height: 35.5)
                    }
                    Button(action: {
                        print("Comment")
                    }) {
                        Image("IconComment")
                            .resizable()
                            .frame(width: 35.0, height: 35.5)
                    }
                    Button(action: {
                        print("Send")
                    }) {
                        Image("IconDirect")
                            .resizable()
                            .frame(width: 35.0, height: 28)
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                
                HStack(spacing: 2) {
                    HStack(spacing: -15) {
                        CircledImageView(imageName: "")
                        CircledImageView(imageName: "")
                        CircledImageView(imageName: "")
                    }
                    .padding(.leading, 75)
                    Text("Liked by ").font(.system(size: 13.5, weight: .regular))
                    +
                    Text("User ").font(.system(size: 13.5, weight: .medium))
                    +
                    Text("and ").font(.system(size: 13.5, weight: .regular))
                    +
                    Text("others").font(.system(size: 13.5, weight: .medium))
                    Spacer()
                }
                .padding(.bottom, 1)
                .padding(.leading, -58)
                
                HStack {
                    Text("User ").font(.system(size: 15.5, weight: .bold))
                    +
                    Text("Our company is resting ❤️").font(.system(size: 13.5, weight: .regular))
                }
                .padding(.leading, -170)

            }
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(sourceType: .photoLibrary)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .previewDevice("")
    }
}


