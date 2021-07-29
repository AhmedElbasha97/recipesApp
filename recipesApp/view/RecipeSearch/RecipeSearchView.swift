//
//  RecipeSearchView.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation
import UIKit
class RecipeSearchView: UIView{
    @IBOutlet weak var searchRecipeSearchBar: UISearchBar!
    @IBOutlet weak var searchRecipeTableView: UITableView!
    @IBOutlet weak var searchRecipeSugmentedController: UISegmentedControl!
    func setUp(view: UIView){
     setUpTableView()
     setUpSegmentedController()
    }
    //MARK:- set Up Table View
    private func setUpTableView(){
        searchRecipeTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        searchRecipeTableView.backgroundColor = .clear
        searchRecipeTableView.separatorStyle = .none
        searchRecipeTableView.allowsSelection = false
    }
    //MARK:- set up navigation bar
   
    //MARK:- set up segmented controller
    private func setUpSegmentedController(){
        searchRecipeSugmentedController.selectedSegmentIndex=4
        searchRecipeSugmentedController.setTitle("All", forSegmentAt: 0)
        searchRecipeSugmentedController.setTitle("Low Sugar", forSegmentAt: 1)
        searchRecipeSugmentedController.setTitle("Keto", forSegmentAt: 2)
        searchRecipeSugmentedController.setTitle("Vegan", forSegmentAt: 3)
    }
}
