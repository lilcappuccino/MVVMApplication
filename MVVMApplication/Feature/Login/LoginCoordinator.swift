//
//  LoginCoordinator.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 20.03.2022.
//

import Foundation
import UIKit

final class LoginCoordinator: BaseCoordinator {
  
    let window: UIWindow
    let service: UserService
    
    init(window: UIWindow, service: UserService) {
        self.service = service
        self.window = window;
    }
    
    override func start() {
        let viewModel = LoginViewModel(userService: service)
        let vc = LoginViewController(viewModel: viewModel, customView: LoginView())
        viewModel.output.loginSuccess
            .sink(receiveValue: { [weak self] _ in
                self?.openMainTabbar()
            }).store(in: &viewModel.cancellableSet)
        
        navigationController.viewControllers = [vc]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func openMainTabbar() {
        self.parentCoordinator?.didFinish(coordinator: self);
        self.delegate?.free(coordinator: self);
    }
}
