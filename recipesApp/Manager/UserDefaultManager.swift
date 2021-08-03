//
//  UserDefaultManager.swift
//  recipesApp
//
//  Created by bido elbasha on 03/08/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    // MARK:- Singleton
    private static let sharedInstance = UserDefaultsManager()
    
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    // MARK:- Properties
    var iDOfDeletedSearch: Int? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.iDOfDeletedSearch)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.iDOfDeletedSearch) != nil else {
                return nil
            }
            return UserDefaults.standard.integer(forKey: UserDefaultsKeys.iDOfDeletedSearch)
        }
    }
    


}
