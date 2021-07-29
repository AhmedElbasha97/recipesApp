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
    class func SearchForRecipes(completion: @escaping (Result<RecipeSearch, Error>) -> Void) {
        request(APIRouter.searchForRecipes(search: "chicken")) { (response) in
            completion(response)
        }
     }
    class func paginationForSearchRecipes(completion: @escaping (Result<RecipeSearch, Error>) -> Void) {
        request(APIRouter.pagintionforSearchReciepies(URL: "https://api.edamam.com/api/recipes/v2?q=chicken&app_key=f8859842ad0beb95306523f0513bb47a&_cont=CHcVQBtNNQphDmgVQntAEX4BYldtBAEFQmNBA2MTZFFxBQsPUXlSB2AXZVJzUgIAEWFGBDcbZFclUQoBSm1FBmUVZ1MhAgAVLnlSVSBMPkd5AAMbUSYRVTdgMgksRlpSAAcRXTVGcV84SU4%3D&type=public&app_id=82e9f70b")) { (response) in
            completion(response)
        }
    }
    class func RecipesDetails(completion: @escaping (Result<ReciepeDetails, Error>) -> Void) {
            request(APIRouter.recipeDetails(URL: "https://api.edamam.com/api/recipes/v2/recipe_379d5e1cd14a8339773a9477428c33f0?type=public&app_id=42f14c43&app_key=efd905e30b78041fd5a19c70c99c3a75")) { (response) in
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
