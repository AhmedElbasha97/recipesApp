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
    func hideNoDataImage()
    func showAlert(message: String)
    func showRecentSerchTableView()
    func showRecipeTableView()
    func reloadRecentSearch()
     
}

class RecipeSearchVC: UIViewController {
    @IBOutlet weak var RecipeSearchView: RecipeSearchView!
       var searchedText: String!
    var anotherViewHasbeenDismised:Bool = false
    private var viewModel: recipeSearchViewModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = recipeSearchViewModel(view: self)
        self.RecipeSearchView.recipeTableView()
        RecipeSearchView.searchRecipeSugmentedController.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        RecipeSearchView.setUp(view: RecipeSearchView)
        self.setupNavigationItems(backAction: .dismissCurrent, haveBackBTN: false, title: "Recipe Search", view: RecipeSearchView){
            () in print("hi")
        }
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
        RecipeSearchView.recentSearchTableView.register(UINib(nibName: Cells.recenSearchTableViewCell, bundle: nil), forCellReuseIdentifier: Cells.recenSearchTableViewCell)
        RecipeSearchView.recentSearchTableView.dataSource = self
        RecipeSearchView.recentSearchTableView.delegate = self
        
    }
    private func setupSearchBarView(){
        RecipeSearchView.searchRecipeSearchBar.delegate = self
    }
}
extension RecipeSearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == self.RecipeSearchView.searchRecipeTableView ? self.viewModel.counter(): self.viewModel.counterforRecentSearchData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        if (tableView == self.RecipeSearchView.searchRecipeTableView){
        guard let cell = self.RecipeSearchView.searchRecipeTableView.dequeueReusableCell(withIdentifier: Cells.recipeSearchTableViewCell , for: indexPath) as? recipeSearchTableViewCell else {
            return UITableViewCell()
        }
        cell.shadowAndBorderForCell(yourTableViewCell: cell)
        cell.sendDataToViewModel(dataofTheCell: (viewModel?.sentData(index: indexPath.row) ?? nil)!)
            returnCell = cell
            
        }else{
            guard let cell = self.RecipeSearchView.recentSearchTableView.dequeueReusableCell(withIdentifier: Cells.recenSearchTableViewCell , for: indexPath) as? RecenSearchTableViewCell else {
                      return UITableViewCell()
                  }
            cell.configure(recentSearcLabel: self.viewModel.getRecentSearchKeyWord(index: indexPath.row))
            returnCell = cell
        }
        return returnCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         if (tableView == self.RecipeSearchView.searchRecipeTableView){
            self.viewModel.anotherPage(index:indexPath.row)}
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if (tableView == self.RecipeSearchView.searchRecipeTableView){
        let recipeDetailsVC = RecipeDetailsVC.create(URL: viewModel?.sentData(index: indexPath.row).recipe?.url ?? "")
              navigationController?.pushViewController(recipeDetailsVC, animated: true)
         }else{
            self.searchedText = self.viewModel.getRecentSearchKeyWord(index: indexPath.row)
            self.RecipeSearchView.searchRecipeSearchBar.text = self.viewModel.getRecentSearchKeyWord(index: indexPath.row)
            indexChanged()
        }
    }
}

extension RecipeSearchVC: RecipeSearchVCProtocol {
    func reloadRecentSearch() {
         RecipeSearchView.recentSearchTableView.reloadData()
    }
    
    func showRecentSerchTableView() {
        self.RecipeSearchView.searchTableView()
    }
    
    func showRecipeTableView() {
        self.RecipeSearchView.recipeTableView()
    }
    
    func hideNoDataImage() {
       RecipeSearchView.hideNoDataImage()
    }
    
    func showNoDataImage() {
        RecipeSearchView.showNoDataImage()
    }
    
    func showloader() {
        self.view.showLoader()
    }
    
    func hideLoader() {
       self.view.hideLoader()
    }
    
    func showAlert(message: String) {
        self.displayalert(title: "Sorry",message: "\(message)")
    }
    
    func reloadData() {
        RecipeSearchView.searchRecipeTableView.reloadData()
    }
}
extension RecipeSearchVC: UISearchBarDelegate {
    func willChangeValue<Value>(for keyPath: __owned KeyPath<RecipeSearchVC, Value>) {
        
        self.viewModel.decideWhichTableViewToShow(anotherViewHasbeenDismised: false)
        self.viewModel.getRecentSearchedData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         self.viewModel.decideWhichTableViewToShow(anotherViewHasbeenDismised: false)
        self.viewModel.getRecentSearchedData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if (RecipeSearchView.searchRecipeSearchBar.text != ""){
            self.anotherViewHasbeenDismised = true
        }else{
            self.anotherViewHasbeenDismised = false
        }
        self.viewModel.decideWhichTableViewToShow(anotherViewHasbeenDismised: self.anotherViewHasbeenDismised)
        self.viewModel.getRecentSearchedData()

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
        guard let text =  RecipeSearchView.searchRecipeSearchBar.text else { return }
        
       searchedText = text
        indexChanged()
    }
    
}
