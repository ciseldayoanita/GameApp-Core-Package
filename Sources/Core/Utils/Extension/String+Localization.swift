//
//  String+Localization.swift
//
//
//  Created by Ciselda Yoanita P on 25-06-2024.
//

import Foundation

extension String {
  public func localized(identifier: String) -> String {
    let bundle = Bundle(identifier: identifier) ?? .main
    return bundle.localizedString(forKey: self, value: nil, table: nil)
  }
}
