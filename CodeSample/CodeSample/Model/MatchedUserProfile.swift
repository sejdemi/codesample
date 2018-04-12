//
//  MatchedUserProfile.swift
//  CodeSample
//
//  Created by Sejan Miah on 4/12/18.
//  Copyright © 2018 Sejan Miah. All rights reserved.
//

import Foundation

struct MatchedUserProfile {
  
  let username: String
  let matchPercentage: Double
  let state: String
  let age: Int
  let photoThumbnail: String
  let city: String
  let isOnline: Int
  
  //initializing a dictionary object of type [String : Any] to be able to capture the JSON values
   init?(dictionary: JSON) {
    
    guard let username = dictionary["username"] as? String,
    let matchPercentage = dictionary["match"] as? Double,
    let state = dictionary["state_code"] as? String,
    let age = dictionary["age"] as? Int,
    let photos = dictionary["photo"] as? JSON,
    let photoThumbnail = photos["base_path"] as? String,
    let city = dictionary["city_name"] as? String,
    let isOnline = dictionary["is_online"] as? Int else {return nil}
    
    self.username = username
    self.matchPercentage = matchPercentage
    self.state = state
    self.age = age
    self.photoThumbnail = photoThumbnail
    self.city = city
    self.isOnline = isOnline
  }
  
  
}
