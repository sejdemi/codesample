import Foundation

//enum to help us understand what type of error we have, either we have received no data, or an actual error
enum OkCupidAPIClientError: Error {
  
  //convey we didn't get data back from json serialization
  case nodata
  
  //or show that we actually got an error back when we tried to serialize
  case error
  
  //these are useful for when unrapping optionals during the serialization process
}
