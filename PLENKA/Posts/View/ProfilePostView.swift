//
//  ProfilePostView.swift
//  PLENKA
//
//  Created by Nariman on 18.07.2023.
//

import SwiftUI

struct ProfilePostView: View {
    @State public var isShowPhotoLibrary = false
    @State public var likeTap = false
    @State public var openImagePicker = false
    @State public var openComments = false
    @State public var SeeAllComments = false
    @State public var selectedImages: [String] = []
    @State public var addComment = ""
    var photos: [String] = ["UserPhoto"]
    
    var body: some View {
        ZStack {
            ScrollView {
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
                            Text(TextContainment.userName.text)
                                .font(.system(size: 20.5, weight: .heavy))
                            Text(TextContainment.location.text)
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
                            .frame(width: 90, height: 90)
                            .padding(-30)
                            .padding(.leading, 20)
                    }
                    Button(action: {
                        openComments.toggle()
                        print("Comment")
                    }) {
                        Image("comment")
                            .resizable()
                            .frame(width: 110, height: 100)
                            .padding(-35)
                    }
                    .sheet(isPresented: $openComments) {
                        CommentTextField(textField: TextField("Add Comment...", text: $addComment), imageName: "UserPhoto")
                            .presentationDetents([.fraction(0.20), .fraction(0.40), .fraction(0.80)])
                            .presentationDragIndicator(.visible)
                    }
                    Spacer()
                }
                    HStack(spacing: 2) {
                        HStack(spacing: -15) {
                            ForEach(0..<3) { _ in
                                CircledImageView(imageName: "")
                            }
                        }
                        .padding(.leading, 70)
                        
                        Text(TextContainment.likedby.text)
                            .font(.system(size: 13.5, weight: .regular))
                        
                        Text(TextContainment.userlikes.text)
                            .font(.system(size: 13.5, weight: .medium))
                        
                        Text("and ")
                            .font(.system(size: 13.5, weight: .regular))
                        
                        Text(TextContainment.otherlikes.text)
                            .font(.system(size: 13.5, weight: .medium))
                        Spacer()
                        Divider()
                    }
                    .padding(.bottom, 1)
                    .padding(.leading, -58)
                    
                    HStack {
                        Text("@" + TextContainment.userName.text)
                            .font(.system(size: 15.5, weight: .bold))
                        Text(TextContainment.discriptionComment.text)
                            .font(.system(size: 13.5, weight: .regular))
                    }
                    .padding(.trailing, 230)
                    .padding(.top, -10)
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            SeeAllComments.toggle()
                        }) {
                            Text(TextContainment.allcomments.text)
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(Color.gray)
                                .padding(.trailing, 265)
                        }
                    }
                    .sheet(isPresented: $SeeAllComments) {
                        CommentsSheet()
                    }
                }
            }
        }
    }

struct ProfilePostView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePostView()
    }
}

