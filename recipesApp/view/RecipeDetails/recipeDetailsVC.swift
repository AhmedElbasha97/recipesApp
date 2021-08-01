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
    func presenterOfSharingOption(view:UIActivityViewController)
     
}
class RecipeDetailsVC: UIViewController {
    @IBOutlet var recipeDetailsView: recipDetailsView!
    private var viewModel: RecipeDetailsViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeDetailsView.setUp(view: recipeDetailsView)
        self.setupNavigationItems(backAction: .dismissCurrent, haveBackBTN: true, title: "recipe Details", view: recipeDetailsView)
        self.setUpNavBar()
        self.setUpData()
        
        // Do any additional setup after loading the view.
    }
    
    class func create(URL: String) -> RecipeDetailsVC {
      let recipeDetailsVC: RecipeDetailsVC = UIViewController.create(storyboardName: Storyboards.main, identifier:
                 ViewControllers.recipeDetailsVC)
        recipeDetailsVC.viewModel = RecipeDetailsViewModel(view: recipeDetailsVC)
        recipeDetailsVC.viewModel?.getDataOfDetailsScreen(url: URL)
             return recipeDetailsVC
         }
    
    @IBAction func recipeDetailsURLButton(_ sender: Any) {
        self.viewModel?.recipeUrlOpener()
    }
}
extension RecipeDetailsVC{
    func setUpNavBar(){
         let SharingItem = UIBarButtonItem(image: UIImage.init(named: "sharingBTN"), style: .done, target: self, action: #selector(sharing))
            SharingItem.tintColor = UIColor.gray
            let rightPadding = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            rightPadding.width = 18
            navigationItem.rightBarButtonItems = [rightPadding, SharingItem]

    }
    
    @objc func sharing() {
        self.viewModel?.sharingOption()
    }
    
    func setUpData(){
        self.viewModel?.recipeImage(completion: { (image) in
            self.recipeDetailsView.ConfigureData(recipeImage: image!, recipeTitle: self.viewModel?.recipeTitle() ?? "", recipeIngridients: self.viewModel?.recipeIngridients() ?? "")
        })
    }

}
extension RecipeDetailsVC: RecipeDetailsVCProtocol {
    func presenterOfSharingOption(view: UIActivityViewController) {
        view.popoverPresentationController?.sourceView = self.view
        self.present(view, animated: true, completion: nil)
    }
    
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
