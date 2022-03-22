//
//  SecondViewModel.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation
import Combine
import CombineCocoa

struct SecondInput: Input {}
struct SecondOutput: Output {}

protocol SecondViewModelType: BaseViewModelType {
    var input: SecondInput { get }
    var output: SecondOutput { get }
    
}

final class SecondViewModel: BaseViewModel, SecondViewModelType {
    
    var input: SecondInput
    var output: SecondOutput
    
    // MARK: - Input
    let service: UserService
    
    init(userService: UserService) {
        self.input = SecondInput()
        self.output = SecondOutput()
        self.service = userService
        super.init()
    }
    
}
