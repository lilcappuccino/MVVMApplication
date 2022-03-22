//
//  UserService.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation
import Combine

protocol UserService {
    func login(email: String, password: String) -> AnyPublisher<Bool, Never>
}

final class UserServiceImpl: UserService {
    
    func login(email: String, password: String) -> AnyPublisher<Bool, Never> {
        // some API logic
        Just(Defaults.isUserLoggined()).eraseToAnyPublisher()
    }
    
    func logout() -> AnyPublisher<(), Never> {
        // some API logic
        Just(()).eraseToAnyPublisher()
    }
    
    
}
