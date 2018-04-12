//
//  OkCupidAPIClientResponse.swift
//  CodeSample
//
//  Created by Sejan Miah on 4/12/18.
//  Copyright © 2018 Sejan Miah. All rights reserved.
//

import Foundation

//enum to help us understand if we are passing something through a closure what it is exactly that we are passing, if successful an array of [String: Any] objects, which corresponds to the json data we are trying to pass

enum WikipediaAPIClientResponse {
  case success() //change type
  
  //otherwise return a type of error
  case failure(OkCupidAPIClientError)
}

