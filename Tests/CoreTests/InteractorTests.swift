//
//  InteractorTests.swift
//  
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import XCTest
import Combine
@testable import Core

final class InteractorTests: XCTestCase {
    var cancellable = Set<AnyCancellable>()
    
    func test_execute_shouldCompleteWithSuccessAndExpectedResult() async {
        let mockRepo = MockRepository(expectedResult: .success("test"))
        let sut = Interactor(repository: mockRepo)
        
        let result = await withCheckedContinuation { continuation in
            sut.execute(request: nil)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail(error.localizedDescription)
                        continuation.resume(returning: "")
                    }
                } receiveValue: { value in
                    continuation.resume(returning: value)
                }.store(in: &cancellable)
        }
        XCTAssertEqual(try mockRepo.expectedResult.get(), result)
    }
    
    func test_execute_shouldCompleteWithError() async {
        let mockRepo = MockRepository(expectedResult: .failure(ExampleError.error))
        let sut = Interactor(repository: mockRepo)
        do {
            let _: String = try await withCheckedThrowingContinuation { continuation in
                sut.execute(request: nil)
                    .sink { completion in
                        switch completion {
                        case .finished:
                            XCTFail("Expected failure but got success")
                            continuation.resume(returning: "")
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    } receiveValue: { _ in }.store(in: &cancellable)
            }
        } catch {
            XCTAssertNotNil(error as? InteractorTests.ExampleError)
        }
    }
    
    func test_execute_shouldPassRequestToRepository() async {
        let mockRepo = MockRepository(expectedResult: .failure(ExampleError.error))
        let sut = Interactor(repository: mockRepo)
        let expectedRequest = "test"
        _ = sut.execute(request: expectedRequest)
        XCTAssertEqual(mockRepo.requestList, [expectedRequest])
    }
    
    enum ExampleError: Error {
        case error
    }
    
    class MockRepository: Repository {
        let expectedResult: Result<String, Error>
        var requestList: [String?] = []
        
        init(expectedResult: Result<String, Error>, requestList: [String?] = []) {
            self.expectedResult = expectedResult
            self.requestList = requestList
        }
        
        func execute(request: String?) -> AnyPublisher<String, Error> {
            requestList.append(request)
            switch expectedResult {
            case .success(let success):
                return Just(success).setFailureType(to: Error.self).eraseToAnyPublisher()
                
            case .failure(let failure):
                return Fail(error: failure).eraseToAnyPublisher()
            }
        }
        
        typealias Request = String
        typealias Response = String
    }
}
