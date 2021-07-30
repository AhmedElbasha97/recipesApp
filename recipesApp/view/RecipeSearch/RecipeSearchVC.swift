//
//  RecipeSearchVC.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import UIKit
protocol RecipeSearchVCProtocol: class {
    func showloader()
    func hideLoader()
    func reloadData()
    func showAlert(message: String)
    func showSortType(sortType: String)
    func showNoData(label1: String)
     
}

class RecipeSearchVC: UIViewController {
    @IBOutlet weak var RecipeSearchView: RecipeSearchView!
       var searchedText: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        RecipeSearchView.searchRecipeSugmentedController.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        RecipeSearchView.setUp(view: RecipeSearchView)
        self.setupNavController(title: "Recipe Search", view: RecipeSearchView)
        setUpTableView()
        setupSearchBarView()
    }
    @objc func indexChanged() {
           if RecipeSearchView.searchRecipeSugmentedController.selectedSegmentIndex == 0 {
               
              
           } else if RecipeSearchView.searchRecipeSugmentedController.selectedSegmentIndex == 1 {
             
                
           } else if RecipeSearchView.searchRecipeSugmentedController.selectedSegmentIndex == 2 {
         
           }else if RecipeSearchView.searchRecipeSugmentedController.selectedSegmentIndex == 3 {
             
           }
           
       }

}
extension RecipeSearchVC{
    private func setUpTableView(){
       RecipeSearchView.searchRecipeTableView.register(UINib(nibName: Cells.recipeSearchTableViewCell, bundle: nil), forCellReuseIdentifier: Cells.recipeSearchTableViewCell)
       RecipeSearchView.searchRecipeTableView.dataSource = self
       RecipeSearchView.searchRecipeTableView.delegate = self
    }
    private func setupSearchBarView(){
        RecipeSearchView.searchRecipeSearchBar.delegate = self
    }
}
extension RecipeSearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.RecipeSearchView.searchRecipeTableView.dequeueReusableCell(withIdentifier: Cells.recipeSearchTableViewCell , for: indexPath) as? recipeSearchTableViewCell else {
            return UITableViewCell()
        }
        
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 256.5
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       
    }
}
extension RecipeSearchVC: RecipeSearchVCProtocol {
    func showSortType(sortType: String) {
          print("hi")
        
    }
    
    func showNoData(label1: String) {
       print("hi")
    }
    

    
    func showloader() {
        self.showLoader()
    }
    
    func hideLoader() {
        self.terminateLoader()
    }
    
    func showAlert( message: String) {
        
    }
    
    func reloadData() {
        RecipeSearchView.searchRecipeTableView.reloadData()
    }
}
extension RecipeSearchVC: UISearchBarDelegate {
    
  
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text =  RecipeSearchView.searchRecipeSearchBar.text else { return }
       searchedText = text
        if searchedText == ""{
           
        }
       
        indexChanged()
    }
    
}
