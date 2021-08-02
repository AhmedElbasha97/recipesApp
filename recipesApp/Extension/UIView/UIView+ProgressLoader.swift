//
//  viewController+ProgressLoader.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//


import UIKit

extension UIView {
    func showLoader() {
        let activityIndicator = setupActivityIndicator()
        activityIndicator.hidesWhenStopped = true

        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func hideLoader() {
        if let activityIndicator = viewWithTag(333) {
            activityIndicator.removeFromSuperview()
        }
    }
    
    private func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        activityIndicator.center = self.center
        activityIndicator.color = .systemBlue
        activityIndicator.style = .large
        activityIndicator.tag = 333
        return activityIndicator
    }
}
