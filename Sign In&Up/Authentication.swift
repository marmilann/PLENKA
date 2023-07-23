//
//  Authentication.swift
//  PLENKA
//
//  Created by Nariman on 20.07.2023.
//

import SwiftUI

struct Authentication: View {
    @State private var tapCount = 0
    @State private var shouldShowSignUp = false
    @State private var isImageOpen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(isImageOpen ? "AuthWallPapperOpen" : "AuthWallPapperClose")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Button(action: {
                        tapCount += 1
                        if tapCount == 2 {
                            shouldShowSignUp = true
                            isImageOpen = false
                            tapCount = 0
                        }
                        if tapCount == 1 {
                            isImageOpen = true
                        }
                    }) {
                        Image("AuthWallPapperButton")
                            .resizable()
                            .opacity(0.1)
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(.top, 130)
                .padding(.leading, 220)
                
                VStack {
                    NavigationLink(destination: SignIn()) {
                        Circle()
                            .frame(width: 50)
                            .opacity(0.01)
                    }
                    
                }
                .padding(.bottom, 30)
                .padding(.leading, 70)
                
                if shouldShowSignUp {
                    NavigationLink(destination: SignUp(), isActive: $shouldShowSignUp) {
                        EmptyView()
                    }
                }
                
                VStack {
                    Text("touch once")
                        .foregroundColor(.lightShadow)
                        .font(.system(size: 30, weight: .regular))
                    Text("to sign in")
                        .foregroundColor(.lightShadow)
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading, 50)
                }
                .padding(.bottom, 250)
                .padding(.leading, 200)
                
                VStack {
                    Text("doule touch")
                        .foregroundColor(.lightShadow)
                        .font(.system(size: 30, weight: .regular))
                    Text("to sign up")
                        .foregroundColor(.lightShadow)
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading, 50)
                    
                }
                .padding(.top, 500)
                .padding(.leading, 170)
                
                VStack {
                    Image("ArrowGradient")
                        .resizable()
                        .frame(width: 120, height: 100)
                }
                .padding(.leading, 260)
                .padding(.bottom, 100)
                
                VStack {
                    Image("ArrowGradient")
                        .resizable()
                        .frame(width: 120, height: 100)
                        .scaleEffect(x: -1, y: 1)
                        .rotationEffect(.degrees(220))
                }
                .padding(.top, 300)
                .padding(.leading, 300)
            }
        }
    }
}

struct Authentication_Previews: PreviewProvider {
    static var previews: some View {
        Authentication()
    }
}
