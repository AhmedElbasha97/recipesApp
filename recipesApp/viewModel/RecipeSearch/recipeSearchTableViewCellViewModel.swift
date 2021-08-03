//
//  recipeSearchTableViewCellViewModel.swift
//  recipesApp
//
//  Created by ahmed elbasha on 30/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation
import SDWebImage
protocol recipeSearchTableViewCellViewModelProtocol {
    func takeDataFromVC(data:Hit)
}
class recipeSearchTableViewCellViewModel {
    //MARK:- Properties
    private var view: recipeSearchTableViewCellProtocol?
    
    // MARK:- Life Cycle Methods
      init(view: recipeSearchTableViewCellProtocol) {
          self.view = view
      }
}
//MARK:- Private function
extension recipeSearchTableViewCellViewModel{
    //setup health beside each other
    private func setUpHealthLabelString(healthLabel:[String])-> String{
        var healthString = ""
              var i = 0
              for health in healthLabel{
                  if(i !=  healthLabel.count - 1){
                      healthString += (health + ",")
                  }else{
                      healthString += health
                  }
                  i += 1
              }
        return healthString
    }
    //download image
    private func getImageOfRecipe(path: String, completion: @escaping (UIImage?) -> Void) {
         SDWebImageManager.shared.loadImage(with: URL(string: path), options: .highPriority, progress: nil) { (image, _, error, _, _, _) in
         if let error = error {
             print(error.localizedDescription)
         } else if let image = image {
             completion(image)
         }

         }
     }
    
}
//MARK:- conform Protocols
extension recipeSearchTableViewCellViewModel: recipeSearchTableViewCellViewModelProtocol{
    func takeDataFromVC(data: Hit) {
        self.getImageOfRecipe(path: data.recipe?.image ?? "") { (image) in
            self.view?.Configration(recipeImage: image ?? UIImage.init(named: "noFoodImage")!, recipeTitle: data.recipe?.label ?? "", recipeDescription: data.recipe?.source ?? "", recipeHealthLabel: self.setUpHealthLabelString(healthLabel: data.recipe?.healthLabels ?? [""]))
        }
    }
    
    
}
