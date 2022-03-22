//
//  BaseViewModel.swift
//  Architecture
//
//  Created by Vadim Marchenko on 15.03.2022.
//
import Foundation
import Combine

protocol Input {}
protocol Output {}

protocol BaseViewModelType: AnyObject {
    var cancellableSet: Set<AnyCancellable>  { get set }
}

public class BaseViewModel: NSObject, ObservableObject {
    
    var cancellableSet: Set<AnyCancellable> = []
 
    deinit {
        print("\(type(of: self)): Deinited")
    }
}
