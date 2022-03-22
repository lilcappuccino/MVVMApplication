//
//  FirstTabCoordinator.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation
import UIKit

final class FirstViewCoordinator: BaseCoordinator, CoordinatorLifeCycle {
    private let service: UserService
    private(set) var parentController: UIViewController!
    
    init(service: UserService) {
        self.service = service
    }
  
    override func start() {
        let viewModel = FirstViewModel(userService: service)
        let vc = FirstViewController(viewModel: viewModel, customView: FirstView())
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        parentController = vc
    }
    
    func hold(coordinator: Coordinator) {
        
    }
    
    func free(coordinator: Coordinator) {
        
    }
    
    
}
