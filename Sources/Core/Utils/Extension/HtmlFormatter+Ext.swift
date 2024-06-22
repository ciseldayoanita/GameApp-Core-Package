//
//  HtmlFormatter+Ext.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import Foundation

public struct HtmlFormatter {
    public static func htmlToString(html: String) -> String {
        guard let data = html.data(using: .utf8) else { return "" }
        
        do {
            let attributedString = try NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
            return attributedString.string
        } catch {
            print("Error converting HTML to string: \(error)")
            return ""
        }
    }
}
