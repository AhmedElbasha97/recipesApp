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
    @IBOutlet weak var noDataImageView: UIImageView!
    @IBOutlet weak var recentSearchView: UIView!
    @IBOutlet weak var recentSearchTableView: UITableView!
    func setUp(view: UIView){
     setUpTableView()
     setUpSegmentedController()
     setupSearchBarView()
        noDataImageView.isHidden = true
    }
    func showNoDataImage(){
        noDataImageView.isHidden = false
    }
    func hideNoDataImage(){
          noDataImageView.isHidden = true
      }
    
    func searchTableView(){
        searchRecipeTableView.isHidden = true
        searchRecipeSugmentedController.isHidden = true
        recentSearchView.isHidden = false
        recentSearchTableView.isHidden = false
    }
    
    func recipeTableView(){
        searchRecipeTableView.isHidden = false
        searchRecipeSugmentedController.isHidden = false
        recentSearchView.isHidden = true
        recentSearchTableView.isHidden = true
    }


    //MARK:- set Up Table View
    private func setUpTableView(){
        searchRecipeTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        searchRecipeTableView.backgroundColor = .clear
        searchRecipeTableView.separatorStyle = .none
        recentSearchTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        recentSearchTableView.backgroundColor = .clear
        recentSearchTableView.separatorStyle = .none
    }
    //MARK:- set up Search bar
   private func setupSearchBarView(){
       searchRecipeSearchBar.isTranslucent = false
       searchRecipeSearchBar.backgroundImage = UIImage()
       searchRecipeSearchBar.barTintColor = UIColor.white
       searchRecipeSearchBar.tintColor = UIColor.white
   }
    //MARK:- set up segmented controller
    private func setUpSegmentedController(){
        searchRecipeSugmentedController.selectedSegmentIndex=4
        searchRecipeSugmentedController.setTitle("All", forSegmentAt: 0)
        searchRecipeSugmentedController.setTitle("Low Sugar", forSegmentAt: 1)
        searchRecipeSugmentedController.setTitle("Keto", forSegmentAt: 2)
        searchRecipeSugmentedController.setTitle("Vegan", forSegmentAt: 3)
    }
}
