import Foundation

//enum to help us understand if we are passing something through a closure what it is exactly that we are passing, if successful an array of [String: Any] objects, which corresponds to the json data we are trying to pass

enum OkCupidAPIClientResponse {
  case success() //change type
  
  //otherwise return a type of error
  case failure(OkCupidAPIClientError)
}

