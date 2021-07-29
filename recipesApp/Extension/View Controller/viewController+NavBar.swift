//
//  viewController+NavBar.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    func setupNavController(title: String, view: UIView) {
           self.navigationItem.title = title
           self.navigationController?.navigationBar.clipsToBounds = true
           self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
           self.navigationController?.navigationBar.titleTextAttributes = [
               NSAttributedString.Key.foregroundColor : UIColor.darkGray,
               NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
           ]
       }
}
