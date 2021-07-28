//
//  ViewController.swift
//  recipesApp
//
//  Created by ahmed elbasha on 27/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//               APIManager.SearchForRecipes() { (response) in
//                switch response{
//                case .success(let data):
//                 print(data)
//
//                case .failure(let error):
//                print(error)
//                }
//
//            }
        APIManager.RecipesDetails() { (response) in
            switch response{
            case .success(let data):
                print(data.recipe)
            case .failure(let error):
            print(error)
            }
            
        }
//           APIManager.paginationForSearchRecipes() { (response) in
//            switch response{
//            case .success(let data):
//             print(data)
//            case .failure(let error):
//            print(error)
//            }
//            
//        }
          
        }
            
        
        // Do any additional setup after loading the view.
    }




