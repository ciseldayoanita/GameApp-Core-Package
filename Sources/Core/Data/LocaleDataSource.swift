//
//  LocaleDataSource.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import Foundation
import Combine

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> AnyPublisher<[Response], Error>
    func add(entities: [Response]) -> AnyPublisher<Bool, Error>
    func add(entity: Response) -> AnyPublisher<Bool, Error>
    func get(id: Request) -> AnyPublisher<Response, Error>
    func update(id: Request) -> AnyPublisher<Response, Error>
}
