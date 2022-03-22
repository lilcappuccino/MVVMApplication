//
//  ViewController+.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(actionOK)
        self.present(alertController, animated: true, completion: completion)
    }
}
