//
//  FirstViewModel.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//
import Foundation
import Combine
import CombineCocoa

struct FirstInput: Input {}

struct FirstOutput: Output {
    var logoutSuccess: AnyPublisher<Void, Never>
}

protocol FirstViewModelType: BaseViewModelType {
    var input: FirstInput { get }
    var output: FirstOutput { get }
    func logOut()
}


final class FirstViewModel: BaseViewModel, FirstViewModelType {
    
    var input: FirstInput
    var output: FirstOutput
    
    // MARK: - Input
    private let logoutSuccessSubject = PassthroughSubject<Void, Never>()
    private let service: UserService
    
    init(userService: UserService) {
        self.input = FirstInput()
        
        self.output = FirstOutput(logoutSuccess: logoutSuccessSubject.eraseToAnyPublisher())
        self.service = userService
        super.init()
    }
    
    func logOut() {
        service.logout()
            .sink(receiveValue: { [weak self] _ in
                self?.logoutSuccessSubject.send()
            })
            .store(in: &cancellableSet)
    }
    
    deinit {
        print(String(describing: self))
    }
    
}
