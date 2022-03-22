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
    func logout() -> AnyPublisher<(), Never> 
}

final class UserServiceImpl: UserService {
    
    func login(email: String, password: String) -> AnyPublisher<Bool, Never> {
        // some API logic
        Defaults.setUser(loggined: true)
        return Just(Defaults.isUserLoggined()).eraseToAnyPublisher()
    }
    
    func logout() -> AnyPublisher<(), Never> {
        // some API logic
        Defaults.setUser(loggined: false)
        return Just(()).eraseToAnyPublisher()
    }
    
    
}
