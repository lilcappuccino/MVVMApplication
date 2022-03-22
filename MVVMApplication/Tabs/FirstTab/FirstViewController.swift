//
//  FirstViewController.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation

final class FirstViewController: BaseViewController<FirstViewModelType, FirstView> {
    
    weak var coordinator: FirstViewCoordinator?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        customView.actionButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                self?.viewModel.logOut()
            }).store(in: &viewModel.cancellableSet)
    
    }
    
    deinit {
        print(String(describing: self))
    }
}
