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
    @State private var openImagePicker = false
    @State private var openComments = false
    @State private var selectedImages: [String] = []
    
    var photos: [String] = ["UserPhoto"]
    
    var body: some View {
        ZStack {
            ScrollView {
                HStack {
                    Image("IconPlenkaInscription")
                        .resizable()
                        .frame(width: 200.0, height: 55.5)
                    Spacer()
                    Button(action: {
                        openImagePicker.toggle()
                        print("Button tapped")
                    }) {
                        Image("addNewPost")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .padding(.bottom, 10)
                    }
                    .padding(.trailing, 5)
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: -5) {
                        ForEach(0..<7) { _ in
                            StoriesView()
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                Divider()
                    .background(Color.black)
                VStack {
                    HStack {
                        Image("UserPhoto")
                            .resizable()
                            .frame(width: 60.0, height: 60)
                            .clipped()
                            .scaledToFit()
                            .cornerRadius(100)
                            .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading) {
                            Text("ahtyam_10")
                                .font(.system(size: 20.5, weight: .heavy))
                            Text("X-Fit, Kazan")
                                .font(.system(size: 13.5, weight: .regular))
                        }
                        .padding(.leading, -10)
                        
                        Spacer()
                    }
                    ZStack {
                        TabView {
                            ForEach(selectedImages, id: \.self) { imageString in
                                Image(uiImage: UIImage(data: Data(base64Encoded: imageString)!)!)
                                    .resizable()
                            }
                        }
                        .edgesIgnoringSafeArea([.leading, .trailing])
                        .frame(width: 400, height: 350)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                }
                
                Divider()
                    .background(Color.black)
                HStack {
                    Button(action: {
                        likeTap.toggle()
                        print("Like")
                    }) {
                        Image(likeTap ? "likeTapped" : "like")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.trailing, -55)
                    }
                    
                    Button(action: {
                        print("Comment")
                    }) {
                        Image("comment")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.trailing, -60)
                    }
                }
                .padding(.leading, -8)
                .padding(.top, -30)
                .padding(.bottom, -30)
                
                HStack(spacing: 2) {
                    HStack(spacing: -15) {
                        ForEach(0..<3) { _ in
                            CircledImageView(imageName: "")
                        }
                    }
                    .padding(.leading, 80)
                    
                    Text("Liked by ")
                        .font(.system(size: 13.5, weight: .regular))
                    
                    Text("Kirill, Nariman ")
                        .font(.system(size: 13.5, weight: .medium))
                    
                    Text("and ")
                        .font(.system(size: 13.5, weight: .regular))
                    
                    Text("others users")
                        .font(.system(size: 13.5, weight: .medium))
                    
                    Spacer()
                    Divider()
                }
                .padding(.bottom, 1)
                .padding(.leading, -58)
                
                HStack {
                    Text("@ahtyam_10")
                        .font(.system(size: 15.5, weight: .bold))
                        .padding(.leading, -15)
                    
                    Text("Resting...")
                        .font(.system(size: 13.5, weight: .regular))
                }
                .padding(.leading, -170)
                
                VStack {
                    Spacer()
                    Button(action: {
                        openComments.toggle()
                    }) {
                        Text("See all comments (99)")
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(Color.gray)
                            .padding(.trailing, 235)
                    }
                }
                .sheet(isPresented: $openComments) {
                    CommentsView()
                }
            }
            .sheet(isPresented: $openImagePicker) {
                ImagePicker(selectedImages: $selectedImages, isPresented: $openImagePicker)
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


