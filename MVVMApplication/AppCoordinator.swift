//
//  AppCoordinator.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 20.03.2022.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator, CoordinatorLifeCycle {
    
    private let window: UIWindow
    private let service: UserService
    
    init(window: UIWindow) {
        self.window = window
        self.service = UserServiceImpl()
    }
    
    override func start() {
        if Defaults.isUserLoggined() {
            openLogin()
        } else {
            openMainTabCoordinator()
        }
    }
    
    private func openLogin() {
        removeChildCoorninators()
        let loginCoordinator = LoginCoordinator(window: window, service: service)
        loginCoordinator.delegate = self
        start(coordinator: loginCoordinator)
    }
    
    func hold(coordinator: Coordinator) {
        
    }
    
    func free(coordinator: Coordinator) {
        switch coordinator {
        case is LoginCoordinator:
            openMainTabCoordinator()
        default: break
        }
    }
    
    private func openMainTabCoordinator() {
        removeChildCoorninators()
        let coordinator = MainCoordinator(window: window, service: service)
        coordinator.delegate = self
        start(coordinator: coordinator)
    }
}
