//
//  FollowersView.swift
//  PLENKA
//
//  Created by Nariman on 18.07.2023.
//

import SwiftUI

struct FollowersView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    ForEach(0..<10) { _ in
                       AccountView()
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

    struct FollowersView_Previews: PreviewProvider {
        static var previews: some View {
            FollowersView()
        }
    }
