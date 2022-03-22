//
//  LoginView.Modelswift.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 20.03.2022.
//

import Foundation
import Combine
import CombineCocoa

struct LoginInput: Input {
    var emailPublisher: CurrentValueSubject<String?, Never>
    var passowrdPublisher: CurrentValueSubject<String?, Never>
}
struct LoginOutput: Output {
    var loginSuccess: AnyPublisher<Void, Never>
    var failure: AnyPublisher<String, Never>
}

protocol LoginViewModelType: BaseViewModelType {
    var input: LoginInput { get }
    var output: LoginOutput { get }
    
    func login()
}


final class LoginViewModel: BaseViewModel, LoginViewModelType {
    
    var input: LoginInput
    var output: LoginOutput
    
    // MARK: - Input
    private let emailSubject = CurrentValueSubject<String?, Never>("")
    private let passowrdSubject = CurrentValueSubject<String?, Never>("")
    
    // MARK: - Output
    private let loginSuccessSubject = PassthroughSubject<Void, Never>()
    private let failureSubject = PassthroughSubject<String, Never>()
    private let service: UserService
    
    init(userService: UserService) {
        self.input = LoginInput(emailPublisher: emailSubject,
                                passowrdPublisher: passowrdSubject)
        
        self.output = LoginOutput(loginSuccess: loginSuccessSubject.eraseToAnyPublisher(),
                                  failure: failureSubject.eraseToAnyPublisher())
        self.service = userService
        super.init()

    }
    
    func login() {
        let email = emailSubject.value ?? ""
        let passowrd = passowrdSubject.value ?? ""
        if !email.isEmailValid {
            failureSubject.send("Please input valid email")
            return
        }

        if !passowrd.isPasswordValid {
            failureSubject.send("Password field must have 1 lowercase, 1 uppercase, 1 number, 1 special character and be at least 8 characters.")
            return
        }
        
        service.login(email: email, password: passowrd)
            .sink(receiveValue: { [weak self] _ in
                print("The user logged in successfully.")
                self?.loginSuccessSubject.send(())
            }).store(in: &cancellableSet)
    }
    
    deinit {
        print(String(describing: self))
    }
}
