import Foundation
import Alamofire

typealias JSON = [String: Any]

final class OkCupidAPIClient {
  
  static func fetchAllMatchedUsers(completion: @escaping (OkCupidAPIClientResponse, [MatchedUserProfile]?) -> ()) {
    let url = "https://www.okcupid.com/matchSample.json"
    Alamofire.request(url, method: .get).responseJSON { (response) in
      if let json = response.result.value as? JSON  {
        let matchedUserProfiles = parseUserJSON(with: json)
        completion(.success(), matchedUserProfiles)
      } else {
        completion(.failure(.nodata), nil)
      }
    }
  }
  
  static func parseUserJSON(with json: JSON) -> [MatchedUserProfile]? {
    var matchedUserProfiles: [MatchedUserProfile] = []
    if let responseJSON = json["data"] as? [JSON] {
      for matchedUserProfile in responseJSON {
        guard let userProfile = MatchedUserProfile(dictionary: matchedUserProfile) else {
          return nil
        }
        matchedUserProfiles.append(userProfile)
      }
    }
    return matchedUserProfiles
  }
  
}
