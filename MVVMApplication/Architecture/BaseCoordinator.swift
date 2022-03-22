//
//  BaseCoordinator.swift
//  Architecture
//
//  Created by Vadim Marchenko on 15.03.2022.
//

import Foundation
import UIKit

class BaseCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]();
    var navigationController = UINavigationController()
    
    weak var delegate: CoordinatorLifeCycle?
    weak var parentCoordinator: Coordinator?
    
    func start() {
        fatalError("\(#function) should be implemented")
    }
    
   final func start(coordinator: Coordinator) {
        childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func start(with option: DeepLinkOption) {
        
    }
  
    
    func didFinish(coordinator: Coordinator) {
        if let first = childCoordinators.firstIndex(where: { $0 === coordinator}) {
            self.childCoordinators.remove(at: first)
        }
    }
    
    func removeChildCoorninators() {
        if childCoordinators.isEmpty { return }
        
        childCoordinators.forEach{ $0.removeChildCoorninators()}
        childCoordinators.removeAll();
    }
    
}
