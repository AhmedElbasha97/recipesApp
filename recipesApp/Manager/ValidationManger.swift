//
//  Validation.swift
//  recipesApp
//
//  Created by bido elbasha on 03/08/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation

class Validations {
    
    //MARK:- Singleton
    private static let sharedInstance = Validations()
    
    //MARK:- Public Methods
    class func shared() -> Validations {
        return Validations.sharedInstance
    }
    
    func isEmptySearch(SearchKeyWord: String?) -> Bool {
        guard let SearchKeyWord = SearchKeyWord?.trimmed, !SearchKeyWord.isEmpty else {
            return false
        }
        return true
    }
    
    func isValidSearch(SearchKewWord: String?) -> Bool {
        let regEx =  "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        if !pred.evaluate(with: SearchKewWord) {
            return false
        }
        return true
    }
    
  
    
}
