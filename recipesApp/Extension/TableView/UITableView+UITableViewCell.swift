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
        let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        yourTableViewCell.contentView.frame = contentView.frame.inset(by: margins)
        yourTableViewCell.contentView.layer.cornerRadius = 8
        yourTableViewCell.contentView.layer.borderWidth = 1
        yourTableViewCell.imageView?.autoresizesSubviews = true
        yourTableViewCell.contentView.layer.borderColor = UIColor.darkGray.cgColor
        yourTableViewCell.contentView.layer.masksToBounds = false
        yourTableViewCell.layer.shadowColor = UIColor.gray.cgColor
        yourTableViewCell.layer.shadowOffset = CGSize(width: 2, height: 1)
        yourTableViewCell.layer.shadowRadius = 1
        yourTableViewCell.layer.shadowOpacity = 0
        yourTableViewCell.layer.masksToBounds = false
        yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect:yourTableViewCell.bounds, cornerRadius:yourTableViewCell.contentView.layer.cornerRadius).cgPath
        yourTableViewCell.layer.cornerRadius = 8
         yourTableViewCell.layer.shadowOffset = CGSize(width: 0, height: 3)
         yourTableViewCell.layer.shadowRadius = 9
         yourTableViewCell.layer.shadowOpacity = 0.3
         yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
         let separatorView = UIView(frame: CGRect(x: yourTableViewCell.separatorInset.left, y: 0, width: 20, height: 1))
        separatorView.backgroundColor = UIColor.red
        separatorView.translatesAutoresizingMaskIntoConstraints  = false
        yourTableViewCell.layer.shouldRasterize = true
        yourTableViewCell.layer.rasterizationScale = UIScreen.main.scale
    }
}
