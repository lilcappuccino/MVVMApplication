//
//  FirstViewModel.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//
import Foundation
import Combine
import CombineCocoa

struct FirstInput: Input {}
struct FirstOutput: Output {}

protocol FirstViewModelType: BaseViewModelType {
    var input: FirstInput { get }
    var output: FirstOutput { get }
    
}


final class FirstViewModel: BaseViewModel, FirstViewModelType {
    
    var input: FirstInput
    var output: FirstOutput
    
    // MARK: - Input
    let service: UserService
    
    init(userService: UserService) {
        self.input = FirstInput()
        
        self.output = FirstOutput()
        self.service = userService
        super.init()

    }
    
}
