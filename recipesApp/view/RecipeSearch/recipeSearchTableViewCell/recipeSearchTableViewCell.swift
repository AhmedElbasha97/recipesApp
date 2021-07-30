//
//  recipeSearchTableViewCell.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit
protocol recipeSearchTableViewCellProtocol {
    func sendDataToViewModel(dataofTheCell:Hit)
    func Configration(recipeImage:UIImage,recipeTitle:String,recipeDescription:String,recipeHealthLabel:String)
}
class recipeSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeSourceLabel: UILabel!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    var delegate: recipeSearchTableViewCell?
    var viewModel: recipeSearchTableViewCellViewModelProtocol?
    var callback: ((UITableViewCell) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        SetUpUILabel()
        self.viewModel = recipeSearchTableViewCellViewModel(view: self)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension recipeSearchTableViewCell{
   private func configure(recipeImage:UIImage,recipeTitle:String,recipeDescription:String,recipeHealthLabel:String){
        self.recipeImage.image=recipeImage
        self.recipeTitleLabel.text = recipeTitle
        self.recipeSourceLabel.text = recipeDescription
        self.recipeCategoryLabel.text = recipeHealthLabel
    }
}
extension recipeSearchTableViewCell{
    private func SetUpUILabel(){
        recipeTitleLabel.sizeToFit()
         recipeTitleLabel.numberOfLines = 0
    }
}
extension recipeSearchTableViewCell: recipeSearchTableViewCellProtocol{
    func sendDataToViewModel(dataofTheCell: Hit) {
        viewModel?.takeDataFromVC(data: dataofTheCell)
    }
    
    func Configration(recipeImage: UIImage, recipeTitle: String, recipeDescription: String, recipeHealthLabel: String) {
        configure(recipeImage: recipeImage, recipeTitle: recipeTitle, recipeDescription: recipeDescription, recipeHealthLabel: recipeHealthLabel)
    }
    
    
}
