//
//  recipeDetailsVC.swift
//  recipesApp
//
//  Created by ahmed elbasha on 31/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit
import SafariServices
protocol RecipeDetailsVCProtocol: class {
    func showloader()
    func hideLoader()
    func showAlert(message: String)
    func presenterofWeb(view: SFSafariViewController)
     
}
class RecipeDetailsVC: UIViewController {
    @IBOutlet var recipeDetailsView: recipDetailsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeDetailsView.setUp(view: recipeDetailsView)
        // Do any additional setup after loading the view.
    }
    
    class func create(URL: Int) -> RecipeDetailsVC {
      let recipeDetailsVC: RecipeDetailsVC = UIViewController.create(storyboardName: Storyboards.main, identifier:
                 ViewControllers.recipeDetailsVC)
            
             return recipeDetailsVC
         }
    
    @IBAction func recipeDetailsURLButton(_ sender: Any) {
        
    }
}
extension RecipeDetailsVC: RecipeDetailsVCProtocol {
    func presenterofWeb(view: SFSafariViewController) {
        present(view, animated: true)
    }
    
    func showloader() {
        self.showLoader()
    }
    
    func hideLoader() {
        self.terminateLoader()
    }
    
    func showAlert(message: String) {
        self.displayalert(title: "Sorry",message: "\(message)")
    }
    
}
