//
//  APIClient.swift
//  APIClientSample
//
//  Created by Azuma on 2018/05/08.
//  Copyright © 2018年 Azuma. All rights reserved.
//

import Foundation

class APIClient {
    
    enum Result {
        case success([String:Any])
        case failure(Error)
    }
    
    public static func apiResult(url: String = "https://httpbin.org/get", completion: @escaping (Result) -> Void) {
        let request = URLRequest(url: URL(string: url)!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                completion(.failure(error!))
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                if let json = json as? [String:Any] {
                    completion(.success(json))
                    return
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
