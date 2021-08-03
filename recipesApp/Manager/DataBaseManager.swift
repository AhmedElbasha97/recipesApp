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
    static let sharedInstance = DatabaseManager()
    private var db: Connection? = nil
    private let searchedData = Table("searchedData")
    private let id = Expression<Int>("id")
    private let keyWord = Expression<String>("keyWord")
   
    
    static func shared() -> DatabaseManager {
        return DatabaseManager.sharedInstance
    }
    
    
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
    
    func isSearchedDataTableExists() -> Bool {
        if (try? db?.scalar(searchedData.exists)) != nil {
            return true
        }
        return false
    }
    func insertSearchedData(dtext: String) {
        do {
            let insert = searchedData.insert(self.keyWord <- dtext)
            try db!.run(insert)
            
        } catch {
            print("Insert failed")
        }
        print(dtext)
    }
    
    func getSearchedData() -> [String] {
        var cachedData: [String] = []
        
        do {
           let serchedData = try self.db!.prepare(self.searchedData)
            for search in serchedData {
                cachedData.append(search[self.keyWord])
            }
        } catch {
            print("Select failed")
        }
        return cachedData
    }
    
}
