//
//  CustomEmptyView.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import SwiftUI

struct CustomEmptyView: View {
    var image: String
    var title: String
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Image(image)
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 80)
                .padding(.bottom, 16)
            
            Text(title)
                .multilineTextAlignment(.center)

            Spacer()
        } .padding(.leading, 32)
            .padding(.trailing, 32)
    }
}
