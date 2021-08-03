//
//  RecenSearchTableViewCell.swift
//  recipesApp
//
//  Created by bido elbasha on 02/08/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit

class RecenSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var recentSearchLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        SetUpUILabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension RecenSearchTableViewCell{
    func configure(recentSearcLabel:String){
        self.recentSearchLabel.text = recentSearcLabel
    }
}
extension RecenSearchTableViewCell{
    private func SetUpUILabel(){
        recentSearchLabel.textAlignment = .left
        recentSearchLabel.sizeToFit()
         recentSearchLabel.numberOfLines = 0
    }

}
