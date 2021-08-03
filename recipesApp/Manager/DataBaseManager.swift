//
//  DataBaseManager.swift
//  recipesApp
//
//  Created by bido elbasha on 02/08/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//


import Foundation
import SQLite

class DatabaseManager {
    //MARK:- properties
    static let sharedInstance = DatabaseManager()
    private var db: Connection? = nil
    private let searchedData = Table("searchedData")
    private let id = Expression<Int>("id")
    private let keyWord = Expression<String>("keyWord")
    private var counter = 0
    //MARK:lifeCycle func
    static func shared() -> DatabaseManager {
        return DatabaseManager.sharedInstance
    }
    // establesh connection
    func searchDbConnection() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("searchedData").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.db = database
        } catch {
            print(error)
        }
    }
    // create teble
    func createSearchTable() {
        if isSearchedDataTableExists() == false {
            do {
                try db?.run(searchedData.create { t in
                    t.column(self.id, primaryKey: .autoincrement)
                    t.column(self.keyWord,unique: true)
                    print("table created")
                })
            }
            catch   {
                print(error)
            }
        } else {
            print("Table Already Exists")
        }
    }
    //check if the data is there or not
    func isSearchedDataTableExists() -> Bool {
        if (try? db?.scalar(searchedData.exists)) != nil {
            return true
        }
        return false
    }
    //insert New Data
    func insertSearchedData(dtext: String) {
        do {
            let insert = searchedData.insert(self.keyWord <- dtext)
            try db!.run(insert)
            
        } catch {
            print("Insert failed")
            
        }
        print(dtext)
    }
    //Get Data from Database
    func getSearchedData() -> [String] {
        var cachedData: [String] = []
        
        do {
           let serchedData = try self.db!.prepare(self.searchedData)
            for search in serchedData {
                cachedData.append(search[self.keyWord])
            }
            deleteSearch(arrOfSearches: cachedData)
        } catch {
            print("Select failed")
        }
        return cachedData
    }
    //delet oldSearch when the recent search exceed 10 items
    func deleteSearch(arrOfSearches: [String]){
        var idOfOldSearch = UserDefaultsManager.shared().iDOfDeletedSearch ?? 1
        if (arrOfSearches.count > 10) {
            let oldSearch = searchedData.filter(id == idOfOldSearch)
           
            do{
                try self.db!.run(oldSearch.delete())
                idOfOldSearch = idOfOldSearch + 1
            }catch{
                idOfOldSearch = idOfOldSearch - 1
                print("select failed")
            }
           UserDefaultsManager.shared().iDOfDeletedSearch = idOfOldSearch
        }
    }
    
}
