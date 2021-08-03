//
//  UITableView+UITableViewCell.swift
//  recipesApp
//
//  Created by ahmed elbasha on 30/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit
extension UITableViewCell{
    func shadowAndBorderForCell(yourTableViewCell : UITableViewCell){
             yourTableViewCell.contentView.layer.cornerRadius = 25
        yourTableViewCell.contentView.layer.borderWidth = 2
        yourTableViewCell.contentView.layer.borderColor = UIColor.darkGray.cgColor
        yourTableViewCell.contentView.layer.masksToBounds = true
        yourTableViewCell.layer.shadowColor = UIColor.darkGray.cgColor
        yourTableViewCell.layer.shadowOffset = CGSize(width: 2, height: 1)
        yourTableViewCell.layer.shadowRadius = 2
        yourTableViewCell.layer.shadowOpacity = 0
        yourTableViewCell.layer.masksToBounds = false
        yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect:yourTableViewCell.bounds, cornerRadius:yourTableViewCell.contentView.layer.cornerRadius).cgPath
    }
}
