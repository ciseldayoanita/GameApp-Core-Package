//
//  CustomEmptyView.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import SwiftUI

public struct CustomEmptyView: View {
    public var image: String
    public var title: String
    
    public var body: some View {
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
