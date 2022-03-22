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
            .sink(receiveValue: { [weak self] email in
                self?.viewModel.input.emailPublisher.send(email)
            }).store(in: &viewModel.cancellableSet)
        
        customView.passwordField.textPublisher
            .sink(receiveValue: { [weak self] password  in
                self?.viewModel.input.passowrdPublisher.send(password)
            }).store(in: &viewModel.cancellableSet )
            
        customView.actionButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                self?.viewModel.login()
            })
            .store(in: &viewModel.cancellableSet)
        
        // output
        viewModel.output.failure
            .sink(receiveValue:  { [weak self] message in
                self?.showAlert(title: "Error", message: message)
            })
            .store(in: &viewModel.cancellableSet)
    }
    
    deinit {
        print(String(describing: self))
    }
    
}
