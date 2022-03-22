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
    
    init(window: UIWindow) {
        self.window = window;
    }
    
    override func start() {
        let viewModel = LoginViewModel(userService: UserServiceImpl())
        let vc = LoginViewController(viewModel: viewModel, customView: LoginView())
        navigationController.viewControllers = [vc]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
