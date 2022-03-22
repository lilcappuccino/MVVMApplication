//
//  SecondTabCoordinator.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation
import UIKit

final class SecondCoordinator: BaseCoordinator, CoordinatorLifeCycle {
    
    private let service: UserService
    private(set) var parentController: UIViewController!
    
    init(service: UserService) {
        self.service = service
    }
    
    override func start() {
        let viewModel = SecondViewModel(userService: service)
        let vc = SecondViewController(viewModel: viewModel, customView: SecondView())
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        parentController = vc
    }
    
    
    func hold(coordinator: Coordinator) {
        
    }
    
    func free(coordinator: Coordinator) {
        
    }
    
}

