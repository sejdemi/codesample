//
//  OkCupidAPIClient.swift
//  CodeSample
//
//  Created by Sejan Miah on 4/12/18.
//  Copyright © 2018 Sejan Miah. All rights reserved.
//
import Foundation
import Alamofire

final class OkCupidAPIClient {
  
  //created as a final class because no one else should be subclassing this
  static func getProfileMatches(for completion: @escaping (OkCupidAPIClientResponse) -> ())  {
  
    let url = "https://www.okcupid.com/matchSample.json"
    
    Alamofire.request(url, method: .get).responseJSON { (response) in
      guard let json = response.result.value as? [String: Any] else {return}
      
      if let responseJSON = json["data"] as? [[String: Any]] {
        
        for matchedUserProfile in responseJSON {
          let userProfile = MatchedUserProfile(dictionary: matchedUserProfile)
             print(userProfile?.age)
        }
      
        completion(.success())
        
      } else {
        completion(.failure(.nodata))
      }
    }
}

}
