//
//  SignUp.swift
//  PLENKA
//
//  Created by Nariman on 20.07.2023.
//

import SwiftUI

struct SignUp: View {
    @State public var addMail = ""
    @State public var addPassword = ""
    @State public var addConfirmPassword = ""
    @State private var isCustomTabBarShow = false
    @State private var isShowAlert = false
    @State private var alertMassage = ""
     
    var body: some View {
        ZStack {
            Image("AuthWallPapper")
            VStack {
                AuthTextField(textField: TextField("Mail", text: $addMail), imageName: "Mail")
                AuthTextField(textField: TextField("Password", text: $addPassword), imageName: "Lock")
                AuthTextField(textField: TextField("Confirm Password", text: $addConfirmPassword), imageName: "Lock")
            }
            .padding(.bottom, 110)
            HStack {
                Button {
                    guard addPassword == addConfirmPassword else {
                        alertMassage = "Пароли не совпадают"
                        isShowAlert.toggle()
                        return
                    }
                    
                    AuthServices.shared.signUp(email: addMail, password: addPassword) { result in
                        switch result {
                            
                        case .success(let user):
                            alertMassage = "Регистрация прошла успешно! Email \(String(describing: user.email)))"
                            isShowAlert.toggle()
                            addMail = ""
                            addPassword = ""
                            addConfirmPassword = ""
                            isCustomTabBarShow.toggle()
                        case .failure(let error):
                            alertMassage = "Ошибка регистрации \(error.localizedDescription)"
                            isShowAlert.toggle()
                        }
                    }
                    
                } label: {
                    Text("Lets GO")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.top, 300)
            .alert(alertMassage ,
                   isPresented: $isShowAlert) {
                Button {
                } label: {
                    Text("OK ")
                }

            }
        }
        .fullScreenCover(isPresented: $isCustomTabBarShow) {
            CustomTabBar(selectedTab: .profile, allCases: CustomTabBarItem.allCases)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
