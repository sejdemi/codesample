//
//  MatchedUserProfile.swift
//  CodeSample
//
//  Created by Sejan Miah on 4/12/18.
//  Copyright © 2018 Sejan Miah. All rights reserved.
//

import Foundation

struct MatchedUserProfile {
  
  var userID: String
  var matchPercentage: Double
  var state: String
  var age: Int
  var city: String
  
  //initializing a dictionary object of type [String : Any] to be able to capture the JSON values
   init?(dictionary: [String: Any]) {
    
    guard let userID = dictionary["userid"] as? String,
    let matchPercentage = dictionary["match"] as? Double,
    let state = dictionary["state_code"] as? String,
    let age = dictionary["age"] as? Int,
    let city = dictionary["city_name"] as? String else {return nil}
    
    self.userID = userID
    self.matchPercentage = matchPercentage
    self.state = state
    self.age = age
    self.city = city
    

  }
  
  
}
