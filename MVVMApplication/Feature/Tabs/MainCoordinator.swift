//
//  MainCoordinator.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation
import UIKit


enum Tabs: Int {
    case first
    case second
    
    var value: Int {
        return self.rawValue;
    }
}

final class MainCoordinator: BaseCoordinator, CoordinatorLifeCycle {
  
    private let tabbar: UITabBarController
    private var firstTab: FirstViewCoordinator!
    private var secondTab: SecondCoordinator!
    private let window: UIWindow
    private let service: UserService
    private var controlelrs: [UIViewController] = []
    
    init(window: UIWindow, service: UserService) {
        self.window = window
        self.tabbar = UITabBarController()
        self.service = service
        super.init()
        
        self.firstTab = initFirstTabCoordintator()
        self.secondTab = initSecondTabCoordinator()
        self.tabbar.viewControllers = controlelrs
    }
    
    override func start() {
        window.rootViewController = tabbar
        window.makeKeyAndVisible()
    }
    
    private func initFirstTabCoordintator() -> FirstViewCoordinator {
        let coordinator =  FirstViewCoordinator(service: service)
        coordinator.delegate = self
        start(coordinator: coordinator)
        controlelrs.append(coordinator.parentController)
        tabbar.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
        return coordinator
    }
    
    private func initSecondTabCoordinator() -> SecondCoordinator {
        let coordinator =  SecondCoordinator(service: service)
        coordinator.delegate = self
        start(coordinator: coordinator)
        controlelrs.append(coordinator.parentController)
        return coordinator
    }
    
    func free(coordinator: Coordinator) {
        self.parentCoordinator?.didFinish(coordinator: self);
        self.delegate?.free(coordinator: self);
    }
    
}
