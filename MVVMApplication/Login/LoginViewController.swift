//
//  LoginViewController.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 20.03.2022.
//

import Foundation
import Combine

final class LoginViewController: BaseViewController<LoginViewModelType, LoginView> {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        
        // input
        customView.emailField.textPublisher
            .sink(receiveValue: { email in
                self.viewModel.input.emailPublisher.send(email)
            }).store(in: &viewModel.cancellableSet)
        
        customView.passwordField.textPublisher
            .sink(receiveValue: { password  in
                self.viewModel.input.passowrdPublisher.send(password)
            }).store(in: &viewModel.cancellableSet )
            
        customView.actionButton.tapPublisher
            .sink(receiveValue: {
                self.viewModel.login()
            })
            .store(in: &viewModel.cancellableSet)
        
        // output
        viewModel.output.failure
            .sink(receiveValue:  { message in
                self.showAlert(title: "Error", message: message)
            })
            .store(in: &viewModel.cancellableSet)
        
        viewModel.output.loginSuccess
            .sink(receiveValue: {
                
            }).store(in: &viewModel.cancellableSet)
    }
    
}
