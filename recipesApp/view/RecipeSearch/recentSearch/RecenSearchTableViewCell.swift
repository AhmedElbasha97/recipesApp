//
//  RecenSearchTableViewCell.swift
//  recipesApp
//
//  Created by bido elbasha on 02/08/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit

class RecenSearchTableViewCell: UITableViewCell {
  //MARK:- Outlets
    @IBOutlet weak var recentSearchLabel: UILabel!
    //MARK:- life cycle function
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
//MARK:- public function
extension RecenSearchTableViewCell{
    func configure(recentSearcLabel:String){
        self.recentSearchLabel.text = recentSearcLabel
    }
}
//MARK:- private function
extension RecenSearchTableViewCell{
    private func SetUpUILabel(){
         recentSearchLabel.font = UIFont.boldSystemFont(ofSize: 15)
        recentSearchLabel.textAlignment = .left
        recentSearchLabel.sizeToFit()
         recentSearchLabel.numberOfLines = 0
    }

}
