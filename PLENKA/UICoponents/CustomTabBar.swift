//
//  CustomTabBar.swift
//  PLENKA
//
//  Created by Nariman on 12.07.2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<3) { index in
                if index == 1 {
                    Spacer()
                        .frame(width: 60) // Увеличенная кнопка
                }
                
                Button(action: {
                    selectedIndex = index
                }) {
                    Image(systemName: index == 1 ? "plus.circle.fill" : (index == selectedIndex ? "circle.fill" : "circle"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                
                if index == 1 {
                    Spacer()
                        .frame(width: 60) // Увеличенная кнопка
                }
            }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}
