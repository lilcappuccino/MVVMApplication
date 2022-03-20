//
//  BaseViewController.swift
//  Architecture
//
//  Created by Vadim Marchenko on 15.03.2022.
//

import Foundation
import UIKit

public class BaseViewController<BaseViewModelType, BaseView> : UIViewController where BaseView : UIView {
    
   var viewModel: BaseViewModelType
   private(set) var customView: BaseView

    init(viewModel: BaseViewModelType, customView: BaseView) {
        self.viewModel = viewModel
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = customView
    }
}
