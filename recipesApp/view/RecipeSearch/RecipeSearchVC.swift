//
//  RecipeSearchVC.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit

class RecipeSearchVC: UIViewController {

    @IBOutlet weak var RecipeSearchView: RecipeSearchView!
    override func viewDidLoad() {
        super.viewDidLoad()
        RecipeSearchView.setUp(view: RecipeSearchView)
        // Do any additional setup after loading the view.
        self.setupNavController(title: "Recipe Search", view: RecipeSearchView)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
