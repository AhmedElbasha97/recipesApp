//
//  RecipeDetailsViewModel.swift
//  recipesApp
//
//  Created by ahmed elbasha on 31/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation
import SafariServices
import SDWebImage
protocol RecipeDetailsViewModelProtocol {
    func getDataOfDetailsScreen(url:String)
    func recipeUrlOpener()
    func sharingOption()
}
class RecipeDetailsViewModel{
    private weak var view: RecipeDetailsVCProtocol?
    var urlOfRecipe = ""
    var recipeURL = ""
    // MARK:- Life Cycle Methods
    init(view: RecipeDetailsVCProtocol) {
        self.view = view
    }
}

extension RecipeDetailsViewModel{
    private func showRecipe(url: String) {
        if let url = URL(string: "\(url)") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            view?.presenterofWeb(view: vc)
        }
    }
    private func getImageOfRecipe(path: String) {
         SDWebImageManager.shared.loadImage(with: URL(string: path), options: .highPriority, progress: nil) { (image, _, error, _, _, _) in
         if let error = error {
              self.view?.showAlert(message: "\(error.localizedDescription)")
         } else if let image = image {
            self.view?.getRecipeImage(image: image)
         }

         }
     }
    private func returnIngridientsEachNewLine(arrOfStr: [String]){
        let string = arrOfStr.joined(separator: "\u{0085}")
        self.view?.getRecipeIngridients(ingridients: string)
        
    }
    private func getData(url:String){
        
        self.view?.showloader()
        APIManager.RecipesDetails() { (response) in
        switch response{
        case .success(let data):
            
            self.returnIngridientsEachNewLine(arrOfStr: data.recipe?.ingredientLines ?? [])
            self.view?.getRecipeLabel(title: data.recipe?.label ?? "")
            self.getImageOfRecipe(path: data.recipe?.image ?? "")
           
            self.urlOfRecipe = data.recipe?.url ?? ""
            self.recipeURL = data.recipe?.uri ?? ""
        case .failure(let error):
            self.view?.hideLoader()
            self.view?.showAlert(message: "\(error.localizedDescription)")
             
        }
       }
         self.view?.hideLoader()
    }

    private func sharingRecipeURL(url:String){
        
        let objectsToShare:URL = URL(string: "\(url)")!
        let sharedObjects:[AnyObject] = [objectsToShare as AnyObject]
        let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
        self.view?.presenterOfSharingOption(view: activityViewController)
    }
}
extension RecipeDetailsViewModel: RecipeDetailsViewModelProtocol{
    func sharingOption() {
        sharingRecipeURL(url: self.recipeURL)
    }
    
    func getDataOfDetailsScreen(url: String) {
        self.getData(url: url)
    }
    

    
    func recipeUrlOpener() {
        self.showRecipe(url: self.urlOfRecipe)
    }
    
    
}
