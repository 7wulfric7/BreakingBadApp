//
//  APIManager.swift
//  BreakingBadApp
//
//  Created by Deniz Adil on 10/12/20.
//

import Foundation
import Alamofire

class APIManager {
static let shared = APIManager()
    init() {}

// Breaking Bad API   https://www.breakingbadapi.com/api/characters
    
    func getActorInfo(id: Int, completion: @escaping (_ brBaInfo: BreakingBadInfo?,_ error: Error?) -> Void) {
        let url = BASE_URL
        AF.request(url).responseDecodable(of: BreakingBadInfo.self) { response in
            if let error = response.error {
                print(error.localizedDescription)
                completion(nil, error)
                return
            }
            if let brBaInfo = response.value {
                completion(brBaInfo, nil)
            }
        }
    }
}

