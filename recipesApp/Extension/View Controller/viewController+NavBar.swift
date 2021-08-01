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
    func setupNavigationItems(backAction: Back, haveSharingBTN: Bool, haveBackBTN: Bool,title: String, view: UIView, sharingUrl:String) {
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
           if haveSharingBTN{
               let SharingItem = UIBarButtonItem(image: UIImage.init(named: "sharingBTN"), style: .done, target: self, action: #selector(sharing))
               SharingItem.tintColor = UIColor.gray
               let rightPadding = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
               rightPadding.width = 18
               navigationItem.rightBarButtonItems = [rightPadding, SharingItem]
           }
           
       }
       
       @objc func popUpCurrent() {
           navigationController?.popViewController(animated: true)
       }
       
       @objc func dismissCurrent() {
           dismiss(animated: true, completion: nil)
       }
       
    @objc func sharing(url:String) {
              let someText:String = "this recipe is from greatest recipe app"
            let objectsToShare:URL = URL(string: "\(url)")!
            let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
            let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
            self.present(activityViewController, animated: true, completion: nil)
       }
}
