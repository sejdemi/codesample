import Foundation

enum OkCupidAPIClientResponse {
  case success()
  case failure(OkCupidAPIClientError)
}


//enum to help us understand if we are passing something through a closure what it is exactly that we are passing, if successful an array of [String: Any] objects, which corresponds to the json data we are trying to pass


