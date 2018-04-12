//
//  OkCupidAPIClientError.swift
//  CodeSample
//
//  Created by Sejan Miah on 4/12/18.
//  Copyright © 2018 Sejan Miah. All rights reserved.
//

import Foundation

//enum to help us understand what type of error we have, either we have received no data, or an actual error
enum OkCupidAPIClientError: Error {
  
  //convey we didn't get data back from json serialization
  case nodata
  
  //or show that we actually got an error back when we tried to serialize
  case error
  
  //these are useful for the if let/else case in the completion handler during the serialization process
}
