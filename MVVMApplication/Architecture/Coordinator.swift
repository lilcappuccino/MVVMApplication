//
//  Coordinator.swift
//  Architecture
//
//  Created by Vadim Marchenko on 15.03.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController { get }
    
    var delegate: CoordinatorLifeCycle? { get }
    
    func start()
    func start(coordinator: Coordinator)
    func start(with option: DeepLinkOption)
    
    func didFinish(coordinator: Coordinator)
    func removeChildCoorninators()
    
}

protocol CoordinatorLifeCycle: AnyObject {
    func free(coordinator: Coordinator)
}

protocol Navigator {
    associatedtype Destination
    func navigate(to scene: Destination)
}

enum DeepLinkOption {
    
}

