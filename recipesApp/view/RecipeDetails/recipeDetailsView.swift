//
//  recipeDetailsView.swift
//  recipesApp
//
//  Created by ahmed elbasha on 31/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit
class  recipDetailsView: UIView {
    @IBOutlet weak var recipeDetalsImageView: UIImageView!
    @IBOutlet weak var recipeDetailsTitleLabel: UILabel!
    @IBOutlet weak var rwecipeDetailsInstrictionLabel: UILabel!
    @IBOutlet weak var recipeDetailsButton: UIButton!
        func setUp(view: UIView){
            shapeTheBTN(BTN: recipeDetailsButton, titleOfTheButton: "Recipe Site", sizeOfTheFont: 20.0)
         setUpUILabael(size: 25.0, isBold: true, Textolor: UIColor.black, label: recipeDetailsTitleLabel)
         setUpUILabael(size: 20.0, isBold: false, Textolor: UIColor.black, label: rwecipeDetailsInstrictionLabel)
            
            }
    func ConfigureData(recipeImage:UIImage,recipeTitle:String,recipeIngridients:String){
        self.recipeDetalsImageView.image=recipeImage
        self.recipeDetailsTitleLabel.text = recipeTitle
        self.rwecipeDetailsInstrictionLabel.text = recipeIngridients
        
    }
}
extension recipDetailsView{
    private func shapeTheBTN(BTN: UIButton,titleOfTheButton:String, sizeOfTheFont: CGFloat){
        BTN.setTitle("\(titleOfTheButton)", for: .normal)
        BTN.tintColor = UIColor.darkGray
        BTN.backgroundColor = .clear
        BTN.layer.cornerRadius = BTN.frame.height / 4
        BTN.layer.borderWidth = 4
        BTN.titleLabel?.font = UIFont.systemFont(ofSize: sizeOfTheFont)
        BTN.layer.borderColor = UIColor.darkGray.cgColor
        }
    private func setUpUILabael(size: CGFloat, isBold: Bool, Textolor: UIColor,label:UILabel){
          label.textColor = Textolor
        label.textAlignment = .center
          if isBold {
              label.font = UIFont.boldSystemFont(ofSize: size)
            label.sizeToFit()
            label.numberOfLines = 0
          } else {
            label.sizeToFit()
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: size)
          }
      }
}
