//
//  UserDefaultsExtension.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 10/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation


extension UserDefaults {
    
    
    enum UserDefaultsKeys: String {
        
        case isLoggedIn
    }
    
    
    func setIsUserLoggedIn(forValue value: Bool) {
        
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    
    func isUserLoggedIn() -> Bool {
        
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
