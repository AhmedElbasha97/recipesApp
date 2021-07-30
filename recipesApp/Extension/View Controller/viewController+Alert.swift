//
//  viewController+Alert.swift
//  recipesApp
//
//  Created by ahmed elbasha on 30/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit
extension UIViewController{
    func displayalert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
      alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in

          alert.dismiss(animated: true, completion: nil)

      })))

      self.present(alert, animated: true, completion: nil)


    }
}
