//
//  APIRouter.swift
//  recipesApp
//
//  Created by ahmed elbasha on 27/07/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    // The endpoint name
    case searchForRecipes(search:String)
    case pagintionforSearchReciepies(URL:String)
    case recipeDetails(URL:String)

    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
        default:
           return .get
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .searchForRecipes(let search):
            return [PrametersKey.search: search,
                    PrametersKey.app_id:appKey.appId,
                    PrametersKey.app_key:appKey.appKey,
                    PrametersKey.health:"vegan"]
    
        default:
            return nil
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case.searchForRecipes:
            return Urls.Base
        case .pagintionforSearchReciepies(let url):
            return url
        case .recipeDetails(let url):
            return url
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try path.asURL()
        var urlRequest = URLRequest(url: url)
        //httpMethod
        urlRequest.httpMethod = method.rawValue
        switch self {
        default:
            break
        }
        
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: parameters)
    }
}


extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
    
    // type-erasing wrapper
    struct AnyEncodable: Encodable {
        private let _encode: (Encoder) throws -> Void
        
        public init<T: Encodable>(_ wrapped: T) {
            _encode = wrapped.encode
        }
        
        func encode(to encoder: Encoder) throws {
            try _encode(encoder)
        }
    }
}
