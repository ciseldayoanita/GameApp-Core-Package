//
//  TabItem.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import SwiftUI

public struct TabItem: View {
    public var imageName: String
    public var title: String
    
    public var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}
