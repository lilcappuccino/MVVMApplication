//
//  Defaults.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 22.03.2022.
//

import Foundation

final class Defaults {
    private static let defaults = UserDefaults.standard
    
    private enum Key: String {
        case isUserLoggined
    }
    
   static func isUserLoggined() -> Bool {
       return defaults.bool(forKey: Defaults.Key.isUserLoggined.rawValue)
    }
    
    static func setUser(loggined: Bool) {
        defaults.set(loggined, forKey: Defaults.Key.isUserLoggined.rawValue)
    }

}
