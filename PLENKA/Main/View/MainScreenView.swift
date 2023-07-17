//
//  MainScreenView.swift
//  PLENKA
//
//  Created by Nariman on 25.06.2023.
//

import SwiftUI

struct MainScreenView: View {
    @State public var isShowPhotoLibrary = false
    @State public var openImagePicker = false
    @State public var seeAllComments = false
    @State public var selectedImages: [String] = []
    @ObservedObject var viewModel: MainScreenViewModel
    
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
                    PostsView()
                }
                .scrollIndicators(.hidden)
                .padding(.top, -25)
            }
            .sheet(isPresented: $openImagePicker) {
                ImagePicker(selectedImages: $selectedImages, isPresented: $openImagePicker)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel())
            .previewDevice("")
    }
}



