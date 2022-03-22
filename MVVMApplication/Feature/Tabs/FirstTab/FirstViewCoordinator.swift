//
//  FirstTabCoordinator.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation
import UIKit

final class FirstViewCoordinator: BaseCoordinator {
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
        
        viewModel.output.logoutSuccess
            .sink(receiveValue: { [weak self] _ in self?.openLoginScreen() })
            .store(in: &viewModel.cancellableSet)
    }
    
    private func openLoginScreen() {
        self.parentCoordinator?.didFinish(coordinator: self)
        self.delegate?.free(coordinator: self);
    }
    
    deinit {
        print(String(describing: self))
    }
}
