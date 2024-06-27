//
//  CustomError+Ext.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import Foundation

public enum URLError: LocalizedError {
    case invalidRequest
    case invalidResponse
    case addressUnreachable(URL)
    
    public var errorDescription: String? {
        switch self {
        case .invalidRequest: return "Request is null.".localized(identifier: Bundle(for: Identifier.self).bundleIdentifier ?? "")
        case .invalidResponse: return "The server returned an unexpected\nor malformed response.".localized(identifier: Bundle(for: Identifier.self).bundleIdentifier ?? "")
        case .addressUnreachable(let url):
            let localizedFormat = "%@ is unreachable.".localized(identifier: Bundle(for: Identifier.self).bundleIdentifier ?? "")
            return String(format: localizedFormat, url.absoluteString)
                
        }
    }
}

public enum DatabaseError: LocalizedError {
    case invalidInstance
    case requestFailed
    
    public var errorDescription: String? {
        switch self {
        case .invalidInstance: return "Database can't instance.".localized(identifier: Bundle(for: Identifier.self).bundleIdentifier ?? "")
        case .requestFailed: return "Your request failed.".localized(identifier: Bundle(for: Identifier.self).bundleIdentifier ?? "")
        }
    }
}

class Identifier {
    
}
