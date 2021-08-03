//
//  recipeSearchViewModel.swift
//  recipesApp
//
//  Created by ahmed elbasha on 29/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation
protocol recipeSearchViewModelProtocol {
    func searchForRecipes(searchKeyWord:String,filterIndex:Int)
    func counter()->Int
    func anotherPage(index:Int)
    func sentData(index:Int) -> Hit
    func decideWhichTableViewToShow(anotherViewHasbeenDismised: Bool)
    func counterforRecentSearchData() -> Int
    func getRecentSearchKeyWord(index:Int) -> String
    func getRecentSearchedData()
}
class recipeSearchViewModel{
    private weak var view: RecipeSearchVCProtocol?
    var recentSearch:[String] = []
    var arrOfRecipe:[Hit] = []
    var count:Int = 0
    var theTotalNumOfItems:Int = 0
    var urlOfNextPage:String = ""
    let database = DatabaseManager.shared()
    // MARK:- Life Cycle Methods
    init(view: RecipeSearchVCProtocol) {
        self.view = view
        database.searchDbConnection()
        database.createSearchTable()
    }
}
extension recipeSearchViewModel{
    func isEmptySearch(Search: String?) -> Bool {
        guard let Search = Search?.trimmed, !Search.isEmpty else {
            return false
        }
        return true
    }
    
    func getRecentSearchData(){
        self.recentSearch = database.getSearchedData()
        print(database.getSearchedData())
        self.view?.reloadRecentSearch()
    }
    
     func searchForRecipe(searchKeyWord:String,filterIndex:String){
        if (self.isEmptySearch(Search: searchKeyWord)) {
        self.view?.showloader()
        APIManager.SearchForRecipes(search: searchKeyWord, kind: filterIndex) { (response) in
            switch response{
            case .success(let data):
                self.database.insertSearchedData(dtext: searchKeyWord.lowercased())
                print(data.count ?? 0)
                if data.count == 0{
                self.view?.showNoDataImage()
                self.view?.hideLoader()
                    self.view?.showRecipeTableView()
                self.view?.showAlert(message: "There's No Data To Show")
                }else{
                self.view?.hideNoDataImage()
                self.arrOfRecipe=data.hits ?? []
                self.count = data.to ?? 0
                self.theTotalNumOfItems = data.count ?? 0
                    self.urlOfNextPage = data.links?.next?.href ?? " "
                self.view?.hideLoader()
                    self.view?.showRecipeTableView()
                self.view?.reloadData()
                }
            case .failure(let error):
                self.view?.hideLoader()
                self.view?.showAlert(message: "\(error.localizedDescription)")
            print(error)
            }
            }
        }else{
            self.view?.showAlert(message: "there's no text to search about")
        }
    }
    

    
    func AnothePage() {
        self.view?.showloader()
        if (count > theTotalNumOfItems){
            
        }else{
            APIManager.paginationForSearchRecipes(url:self.urlOfNextPage) { (response) in
        switch response{
        case .success(let data):
            print("in pagination")
            self.count = data.to ?? 0
            self.urlOfNextPage = data.links?.next?.href ?? " "
            for data in data.hits ?? []{
            self.arrOfRecipe.append(data)
            }
            
            self.view?.hideLoader()
             self.view?.reloadData()
        print(data)
        case .failure(let error):
            self.view?.hideLoader()
            self.view?.showAlert(message: "\(error.localizedDescription)")
        print(error)
                    }
            
                }
        }
    }
}
extension recipeSearchViewModel: recipeSearchViewModelProtocol{
    func getRecentSearchedData() {
        self.getRecentSearchData()
    }
    
    func decideWhichTableViewToShow(anotherViewHasbeenDismised: Bool) {
               if ((database.isSearchedDataTableExists())&&(!anotherViewHasbeenDismised)){
             self.view?.showRecentSerchTableView()
         }else{
             self.view?.showRecipeTableView()
         }
    }
    
    func getRecentSearchKeyWord(index: Int) -> String {
        return self.recentSearch[index]
    }
    
    
    func counterforRecentSearchData() -> Int {
        return self.recentSearch.count
    }
    
    


    
    func sentData(index: Int) -> Hit {
        return self.arrOfRecipe[index]
    }
    func searchForRecipes(searchKeyWord: String, filterIndex: Int) {
        switch filterIndex {
        case 1:
            searchForRecipe(searchKeyWord: "\(searchKeyWord)", filterIndex: "low-sugar")
            break
        case 2:
            searchForRecipe(searchKeyWord: "\(searchKeyWord)", filterIndex: "keto-friendly")
              break
        case 3:
            searchForRecipe(searchKeyWord: "\(searchKeyWord)", filterIndex: "vegan")
              break
        default:
            searchForRecipe(searchKeyWord: "\(searchKeyWord)", filterIndex: "")
            break
        }
    }
    
    func counter() -> Int {
        return arrOfRecipe.count
    }
 
    func anotherPage(index:Int) {
        
        if (index>=(count-2)){
        AnothePage()
        }
    }
    
    
}
