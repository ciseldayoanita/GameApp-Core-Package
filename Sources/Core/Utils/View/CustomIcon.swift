//
//  CustomIcon.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import SwiftUI

struct CustomIcon: View {
    var imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.title2)
        }
    }
}
