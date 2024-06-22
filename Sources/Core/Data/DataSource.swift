//
//  DataSource.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import Combine

public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
