import Foundation
import Alamofire

//violation of single responsibility principles,

//define typeAlias
typealias JSON = [String : Any]

final class OkCupidAPIClient {
  
  //created as a final class because no one else should be subclassing this
  static func getProfileMatches(for completion: @escaping (OkCupidAPIClientResponse, [MatchedUserProfile]) -> ())  {
    //should this exist here
    var matchedUserProfiles: [MatchedUserProfile] = []
    let url = "https://www.okcupid.com/matchSample.json"
    Alamofire.request(url, method: .get).responseJSON { (response) in
      //need to return something better/is guard the way to go?
      //saw this guard let rawData = data else { handler(false, nil); return }
      guard let json = response.result.value as? JSON else {return}
      if let responseJSON = json["data"] as? [JSON] {
        for matchedUserProfile in responseJSON {
          if let userProfile = MatchedUserProfile(dictionary: matchedUserProfile){
            matchedUserProfiles.append(userProfile)
            print(userProfile.photoThumbnail)
          }
        }
        completion(.success(), matchedUserProfiles)
      } else {
        completion(.failure(.nodata), matchedUserProfiles)
      }
    }
  }
  
}
