//
//  APIManager.swift
//  recipesApp
//
//  Created by ahmed elbasha on 27/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//
import Foundation
import Alamofire
class APIManager {
    //Get data for the frist time
    class func SearchForRecipes(search:String,kind:String,completion: @escaping (Result<RecipeSearch, Error>) -> Void) {
        request(APIRouter.searchForRecipes(search: search, helthFilter: kind)) { (response) in
            completion(response)
        }
     }
    //get the data for next page
    class func paginationForSearchRecipes(url:String,completion: @escaping (Result<RecipeSearch, Error>) -> Void) {
        request(APIRouter.pagintionforSearchReciepies(URL: "\(url)")) { (response) in
            completion(response)
        }
    }
    //get data for detailed screen
    class func RecipesDetails(url:String,completion: @escaping (Result<ReciepeDetails, Error>) -> Void) {
        request(APIRouter.recipeDetails(URL: url)) { (response) in
                completion(response)
            }
     }
        
    
}

extension APIManager {
    // MARK:- The request function to get results in a closure
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
            
        .responseJSON { response in
            print(response)
        }
    }
       //ToDo:- for future api requests
    private static func requestData(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<Data, Error>) -> Void) {
        AF.request(urlConvertible).response { (response) in
            switch response.result {
                
            case .success(let data):
                guard let data = data else {return}
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        .responseJSON { response in
            switch response.result {
                
            case .success(_):
                print(response)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private static func requestBool(_ urlConvertible: URLRequestConvertible, completion: @escaping (Bool) ->  Void) {
        AF.request(urlConvertible).response { response in
            switch response.result {
                
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
        
    }
}
