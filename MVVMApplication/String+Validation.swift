//
//  String+Validation.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation

public extension String {
    
    var isEmailValid: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isPasswordValid: Bool {
        let passwordRegEx = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[*.!@#$%^&(){}\[\]:;<>,.?/~_+-=|]).{8,32}$"#
        return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: self)
    }
}

