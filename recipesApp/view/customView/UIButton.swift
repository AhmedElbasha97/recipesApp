//
//  UIButton.swift
//  recipesApp
//
//  Created by bido elbasha on 03/08/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit

class CommonUIButton: UIButton{
    
    // MARK:- Public Methods
    func setUPUIButton(backGroundColor: UIColor, titleOfTheButton: String, sizeOfTheFont: CGFloat) {
        self.backgroundColor = backGroundColor
        self.layer.cornerRadius = self.frame.height / 4
        self.layer.borderWidth = 0
        self.setTitle("\(titleOfTheButton)", for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.setTitleColor(UIColor.white, for:UIControl.State.normal)
    }
    
}

