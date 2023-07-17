//
//  CommentsSheet.swift
//  PLENKA
//
//  Created by Nariman on 14.07.2023.
//

import SwiftUI



struct CommentsSheet: View {
    @State public var addComment = ""
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(spacing: -5) {
                    
                    ForEach(0..<15) { _ in
                        CommentsView()
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .padding(.top, 20)
    }
}


struct CommentsSheet_Previews: PreviewProvider {
    static var previews: some View {
        CommentsSheet()
    }
}


