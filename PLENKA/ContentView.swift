//
//  ContentView.swift
//  PLENKA
//
//  Created by Nariman on 25.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            navigationBar
            PostView()
        }
    }
}

var navigationBar: some View {
    HStack {
        Image ("IconPlenkaInscription")
            .resizable()
            .frame(width: 200.0, height: 55.5)
        Spacer()
        Button(action: {
            print("Button tapped")
        }) {
            Image("IconNewPhotoAndVideo")
                .resizable()
                .frame(width: 55.0, height: 55.5)
        }
        .padding(.horizontal, 20)
    }
    .padding(.top, 20)
}

struct PostView: View {
    var body: some View {
        VStack {
            header
            content
            actions
            liked
            caption
        }
    }
    
    var header: some View {
        HStack {
            Image("UserPhoto")
                .resizable()
                .frame(width: 60.0, height: 60)
                .clipped()
                .scaledToFit()
                .cornerRadius(100)
                .padding(.horizontal, 10)
            VStack (alignment: .leading){
                Text("UserName")
                    .font(.system(size: 13.5, weight: .medium))
                Text("UserLocation")
                    .font(.system(size: 11.5, weight: .regular))
            }
            Spacer()
        }
        .padding(10)
    }
    
    var content: some View {
        TabView {
            Image("UserPost")
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.bottom, 20)
            Image("UserPost")
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.bottom, 20)
        }
        .padding(.top, -350)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    var actions: some View {
        HStack {
            Button(action: {}) {
                Image("IconLike")
                    .resizable()
                    .frame(width: 35.0, height: 35.5)
            }
            Button(action: {}) {
                Image("IconComment")
                    .resizable()
                    .frame(width: 35.0, height: 35.5)
            }
            Button(action: {}) {
                Image("IconDirect")
                    .resizable()
                    .frame(width: 35.0, height: 28)
            }
            Spacer()
        }
        .padding(/*@START_MENU_TOKEN@*/.leading, 15.0/*@END_MENU_TOKEN@*/)
        .padding(.bottom, 50)
        .padding(.top, -305)
    }
    
    var liked: some View {
        HStack(spacing: 2) {
            HStack(spacing: -15) {
                CircledImageView(imageName: "UserPost")
                CircledImageView(imageName: "UserPost")
                CircledImageView(imageName: "UserPost")
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
        .padding(.top, -250.0)
        .padding(.leading, -65)
    }


    struct CircledImageView: View {
        var imageName: String
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(Color.white)
                Image("UserPhoto")
                    .resizable()
                    .frame(width: 30.0, height: 30)
                    .clipped()
                    .scaledToFit()
                    .cornerRadius(100)
                    .padding(3)
            }
            .frame(width: 40.0, height: 40)
        }
    }
    
    var caption: some View {
        HStack {
            Text("User ").font(.system(size: 15.5, weight: .bold))
            +
            Text("Our company is resting ❤️").font(.system(size: 13.5, weight: .regular))
        }
        .padding(.leading, -175)
        .padding(.top, -210)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("")
    }
}


