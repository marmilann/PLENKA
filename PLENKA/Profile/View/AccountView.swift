//
//  FollowingAccountView.swift
//  PLENKA
//
//  Created by Nariman on 18.07.2023.
//

import SwiftUI

struct AccountView: View {
    @State private var subscribe = false
    
    var body: some View {
        HStack(alignment: .top) {
            Image("Shrek")
                .resizable()
                .frame(width: 55.0, height: 55)
                .clipped()
                .scaledToFit()
                .cornerRadius(100)
                .padding(3)
            VStack(alignment: .leading) {
                Text("Shrek")
                    .font(.system(size: 15.5, weight: .heavy))
                Text("Огр из Болота")
                    .font(.system(size: 15.5, weight: .light))
                    .padding(.trailing, 80)
            }
            .padding(.top, 10)
            VStack {
                if subscribe == false {
                    Button {
                        subscribe.toggle()
                    } label: {
                        Text("подписаться")
                    }
                    .buttonStyle(.borderedProminent)
                } else {
                    Button {
                        subscribe.toggle()
                    } label: {
                        Text("вы подписаны")
                    }
                    .buttonStyle(.bordered)
                }
            }
            .frame(width: 130, height: 40)
            .padding(.top, 7)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
