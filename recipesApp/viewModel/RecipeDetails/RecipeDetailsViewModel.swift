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
    func recipeTitle() -> String
    func recipeIngridients() -> String
    func recipeImage(completion: @escaping (UIImage?) -> Void)
    func recipeUrlOpener()
    func sharingOption()
}
class RecipeDetailsViewModel{
    private weak var view: RecipeDetailsVCProtocol?
    var arrOfIngredient: [String] = []
    var title = ""
    var urlOfRecipe = ""
    var imageURL = ""
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
    private func getImageOfRecipe(path: String, completion: @escaping (UIImage?) -> Void) {
         SDWebImageManager.shared.loadImage(with: URL(string: path), options: .highPriority, progress: nil) { (image, _, error, _, _, _) in
         if let error = error {
              self.view?.showAlert(message: "\(error.localizedDescription)")
         } else if let image = image {
             completion(image)
         }

         }
     }
    private func returnIngridientsEachNewLine(arrOfStr: [String]) -> String{
        let string = arrOfStr.joined(separator: "\u{0085}")
        return string
        
    }
    private func getData(url:String){
        self.view?.showloader()
        APIManager.RecipesDetails() { (response) in
        switch response{
        case .success(let data):
            self.arrOfIngredient = data.recipe?.ingredientLines ?? []
            self.imageURL = data.recipe?.image ?? ""
            self.urlOfRecipe = data.recipe?.url ?? ""
            self.title = data.recipe?.label ?? ""
            self.recipeURL = data.links?.linksSelf?.href ?? ""
            self.view?.hideLoader()
        case .failure(let error):
             self.view?.showAlert(message: "\(error.localizedDescription)")
        }
       }
    }
    private func sharingRecipeURL(url:String){
        let someText:String = "this recipe is from greatest recipe app"
        let objectsToShare:URL = URL(string: "\(url)")!
        let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
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
    
    func recipeTitle() -> String {
        return self.title
    }
    
    func recipeIngridients() -> String {
        return self.returnIngridientsEachNewLine(arrOfStr: self.arrOfIngredient)
    }
    
    func recipeImage(completion: @escaping (UIImage?) -> Void) {
        self.getImageOfRecipe(path: self.imageURL) { (image) in
            completion(image)
        }
    }
    
    func recipeUrlOpener() {
        self.showRecipe(url: self.urlOfRecipe)
    }
    
    
}
