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
    func getRecipeImage(image:UIImage)
    func getRecipeLabel(title: String)
    func hideLoader()
    func getRecipeIngridients(ingridients: String)
    func showAlert(message: String)
    func presenterofWeb(view: SFSafariViewController)
    func presenterOfSharingOption(view:UIActivityViewController)
     
}
class RecipeDetailsVC: UIViewController {
    @IBOutlet var recipeDetailsView: recipDetailsView!
    var url: String!
    private var viewModel: RecipeDetailsViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.getDataOfDetailsScreen(url: self.url)
        self.recipeDetailsView.setUp(view: recipeDetailsView)
        self.setupNavigationItems(backAction: .popUpCurrent, haveBackBTN: true, title: "recipe Details", view: recipeDetailsView)
        self.setUpNavBar()
        
        // Do any additional setup after loading the view.
    }
    
    class func create(URL: String) -> RecipeDetailsVC {
      let recipeDetailsVC: RecipeDetailsVC = UIViewController.create(storyboardName: Storyboards.main, identifier:
                 ViewControllers.recipeDetailsVC)
        recipeDetailsVC.viewModel = RecipeDetailsViewModel(view: recipeDetailsVC)
        recipeDetailsVC.url = URL
       
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
    


}
extension RecipeDetailsVC: RecipeDetailsVCProtocol {
    func getRecipeImage(image:UIImage){
        self.recipeDetailsView.recipeDetalsImageView.image = image
    }
    
    func getRecipeLabel(title: String) {
        self.recipeDetailsView.recipeDetailsTitleLabel.text = title
    }
     
    func getRecipeIngridients(ingridients: String) {
        self.recipeDetailsView.rwecipeDetailsInstrictionLabel.text = ingridients
    }
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
        self.popUpLoader()
    }
    
    func showAlert(message: String) {
        self.displayalert(title: "Sorry",message: "\(message)")
    }
    
}
