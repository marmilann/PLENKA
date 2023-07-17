//
//  CommentsSheet.swift
//  PLENKA
//
//  Created by Nariman on 14.07.2023.
//

import SwiftUI

struct CommentsSheet: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack() {
                ForEach(0..<7) { _ in
                    CommentsView()
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.top, 100)

    }
}

struct CommentsSheet_Previews: PreviewProvider {
    static var previews: some View {
        CommentsSheet()
    }
}
