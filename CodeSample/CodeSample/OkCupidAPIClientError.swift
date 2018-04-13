import Foundation

enum OkCupidAPIClientError: Error {
  case nodata
  case error
}

//enum to help us understand what type of error we have, either we have received no data, or an actual error
//convey we didn't get data back from json serialization
//  //or show that we actually got an error back when we tried to serialize
