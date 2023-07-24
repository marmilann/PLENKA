//
//  SignIn.swift
//  PLENKA
//
//  Created by Nariman on 20.07.2023.
//

import SwiftUI

struct SignIn: View {
    @State private var addMail = ""
    @State private var addPassword = ""
    @State private var isCustomTabBarShow = false
    @State private var isShowAlert = false
    @State private var alertMassage = ""
    
    var body: some View {
        ZStack {
            Image("AuthWallPapper")
            VStack {
                AuthTextField(textField: TextField("Mail", text: $addMail), imageName: "Mail")
                AuthTextField(textField: TextField("Password", text: $addPassword), imageName: "Lock")
            }
            .padding(.bottom, 150)
            HStack {
                Button {
                    AuthServices.shared.signIn(email: addMail, password: addPassword) { result  in
                        switch result {
                            
                        case .success(_):
                            addMail = ""
                            addPassword = ""
                            isCustomTabBarShow.toggle()
                        case .failure(let error):
                            alertMassage = "Ошибка Авторизации: \(error.localizedDescription)"
                            isShowAlert.toggle()
                        }
                    }
                    
                } label: {
                    Text("Lets GO")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.top, 150)
            .alert(alertMassage ,
                   isPresented: $isShowAlert) {
                Button {
                } label: {
                    Text("OK ")
                }
            }
                   .fullScreenCover(isPresented: $isCustomTabBarShow) {
                       CustomTabBar(selectedTab: .profile, allCases: CustomTabBarItem.allCases)
                   }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
