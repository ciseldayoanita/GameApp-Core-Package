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
        case .invalidRequest: return "Request is null."
        case .invalidResponse: return "The server returned an unexpected\nor malformed response."
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
        }
    }
}

public enum DatabaseError: LocalizedError {
    
    case invalidInstance
    case requestFailed
    
    public var errorDescription: String? {
        switch self {
        case .invalidInstance: return "Database can't instance."
        case .requestFailed: return "Your request failed."
        }
    }
}
