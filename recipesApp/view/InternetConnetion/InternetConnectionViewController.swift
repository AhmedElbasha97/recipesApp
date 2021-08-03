//
//  InternetConnectionViewController.swift
//  recipesApp
//
//  Created by bido elbasha on 03/08/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit

class InternetConnectionViewController: UIViewController {

    @IBOutlet weak var RefreshBTN: CommonUIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
          RefreshBTN.setUPUIButton(backGroundColor: UIColor.init(red: 0, green: 260, blue: 204, alpha: 0.8), titleOfTheButton:"Refresh", sizeOfTheFont: 20)
        // Do any additional setup after loading the view.
    }
    



    @IBAction func Refreshing(_ sender: Any) {
        if Reachability.isConnectedToNetwork(){
             navigationController?.popViewController(animated: true)
        }
        }
    class func create() -> InternetConnectionViewController {
      let internetConnectionViewController: InternetConnectionViewController = UIViewController.create(storyboardName: Storyboards.main, identifier:
                 ViewControllers.internetConnectionViewController)
             return internetConnectionViewController
         }
    }

