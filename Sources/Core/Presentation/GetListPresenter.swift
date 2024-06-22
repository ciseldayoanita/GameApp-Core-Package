//
//  GetListPresenter.swift
//
//
//  Created by Ciselda Yoanita P on 22-06-2024.
//

import SwiftUI
import Combine

public class GetListPresenter<
    Request,
    Response,
    Interactor: UseCase
>: ObservableObject where
Interactor.Request == Request,
Interactor.Response == [Response]
{
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let useCase: Interactor
    
    @Published public var list: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor) {
        self.useCase = useCase
    }
    
    public func getList(request: Request?) {
        isLoading = true
        self.useCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { list in
                self.list = list
                self.isError = false
            })
            .store(in: &cancellables)
    }
}
