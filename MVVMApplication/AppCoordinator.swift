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
    
    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        openLogin()
    }
    
   private func openLogin() {
        removeChildCoorninators()
        let loginCoordinator = LoginCoordinator(window: window)
        loginCoordinator.delegate = self
        start(coordinator: loginCoordinator)
    }
    
    func hold(coordinator: Coordinator) {
        
    }
    
    func free(coordinator: Coordinator) {
        
    }
    
}
