//
//  APIManager.swift
//  BreakingBadApp
//
//  Created by Deniz Adil on 10/12/20.
//

import UIKit
import Alamofire

class APIManager {
    static let shared = APIManager()
        init() {}
   
    func getActors(completion: @escaping (_ actors: [BrBad]?, _ error: Error?) -> Void) {
        let url = BASE_URL
        AF.request(url).responseDecodable(of: [BrBad].self) { response in
            if let error = response.error {
                debugPrint(response)
                completion(nil, error)
            }
            if let actors = response.value {
                completion(actors, nil)
            }
        }
    }
}
