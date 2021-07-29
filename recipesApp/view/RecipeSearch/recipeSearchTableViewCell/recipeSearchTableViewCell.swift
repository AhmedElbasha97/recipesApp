//
//  recipeSearchTableViewCell.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit

class recipeSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeSourceLabel: UILabel!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        SetUpUILabel()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension recipeSearchTableViewCell{
    private func SetUpUILabel(){
        recipeTitleLabel.sizeToFit()
         recipeTitleLabel.numberOfLines = 0
    }
}
