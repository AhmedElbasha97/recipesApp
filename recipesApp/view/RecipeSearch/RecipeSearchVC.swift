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
    func showNoDataImage()
    func showAlert(message: String)
     
}

class RecipeSearchVC: UIViewController {
    @IBOutlet weak var RecipeSearchView: RecipeSearchView!
       var searchedText: String!
    private var viewModel: recipeSearchViewModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = recipeSearchViewModel(view: self)
        RecipeSearchView.searchRecipeSugmentedController.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        RecipeSearchView.setUp(view: RecipeSearchView)
        self.setupNavController(title: "Recipe Search", view: RecipeSearchView)
        setUpTableView()
        setupSearchBarView()
    }
    @objc func indexChanged() {
        viewModel.searchForRecipes(searchKeyWord: searchedText, filterIndex: RecipeSearchView.searchRecipeSugmentedController.selectedSegmentIndex)
           
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
        return self.viewModel.counter()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.RecipeSearchView.searchRecipeTableView.dequeueReusableCell(withIdentifier: Cells.recipeSearchTableViewCell , for: indexPath) as? recipeSearchTableViewCell else {
            return UITableViewCell()
        }
        cell.shadowAndBorderForCell(yourTableViewCell: cell)
        cell.sendDataToViewModel(dataofTheCell: (viewModel?.sentData(index: indexPath.row) ?? nil)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewModel.anotherPage(index:indexPath.row)
    }
}

extension RecipeSearchVC: RecipeSearchVCProtocol {
    func showNoDataImage() {
        RecipeSearchView.showNoDataImage()
    }
    
    func showloader() {
        self.showLoader()
    }
    
    func hideLoader() {
        self.terminateLoader()
    }
    
    func showAlert(message: String) {
        self.displayalert(title: "Sorry",message: "\(message)")
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
