import Foundation
import Alamofire
//where does this typealias go
typealias JSON = [String: Any]

final class OkCupidAPIClient {
  static func fetchAllMatchedUsers(completion: @escaping (OkCupidAPIClientResponse, [MatchedUserProfile]) -> ())  {
    var matchedUserProfiles: [MatchedUserProfile] = []
    let url = "https://www.okcupid.com/matchSample.json"
    Alamofire.request(url, method: .get).responseJSON { (response) in
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
