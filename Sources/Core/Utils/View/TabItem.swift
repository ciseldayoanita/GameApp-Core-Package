//
//  TabItem.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import SwiftUI

struct TabItem: View {
    var imageName: String
    var title: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}
