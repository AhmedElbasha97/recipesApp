//
//  Constant.swift
//  recipesApp
//
//  Created by ahmed elbasha on 27/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation
//Story Board ID
struct Storyboards {
    static let main = "Main"
}
//View Controller ID
struct ViewControllers {
    static let recipeDetailsVC = "RecipeDetailsVC"
    static let internetConnectionViewController = "InternetConnectionViewController"
}
// UserDefaultsKeys
struct UserDefaultsKeys {
    static let iDOfDeletedSearch = "iDOfDeletedSearch"
}
//Parameters key
struct PrametersKey {
    static let type = "type"
    static let search = "q"
    static let app_id = "app_id"
    static let app_key = "app_key"
    static let health = "health"
}
//URLS
struct Urls {
    static let Base = "https://api.edamam.com/api/recipes/v2"
}
//APP Key Auth
struct appKey {
    static let appId = "82e9f70b"
    static let appKey = "f8859842ad0beb95306523f0513bb47a"
}
//Param Value
struct type {
    static let pub = "public"
}
//Cells ID
struct Cells {
    static let recenSearchTableViewCell = "RecenSearchTableViewCell"
    static let recipeSearchTableViewCell = "recipeSearchTableViewCell"
}
