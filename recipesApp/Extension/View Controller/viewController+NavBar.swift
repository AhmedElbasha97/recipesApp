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
     enum Back: String {
        case dismissCurrent
        case popUpCurrent
    }
    func setupNavigationItems(backAction: Back, haveBackBTN: Bool,title: String, view: UIView) {
        self.navigationItem.title = title
        self.navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.darkGray,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
        ]
        if haveBackBTN{
            let backItem = UIBarButtonItem(image: UIImage.init(named: "back2"), style: .done, target: self, action: Selector(backAction.rawValue))
            backItem.tintColor = UIColor.gray
           let leftPadding = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
           leftPadding.width = 18
           navigationItem.leftBarButtonItems = [leftPadding, backItem]
        }
       }
       
       @objc func popUpCurrent() {
           navigationController?.popViewController(animated: true)
       }
       
       @objc func dismissCurrent() {
           dismiss(animated: true, completion: nil)
       }
       
    
}

