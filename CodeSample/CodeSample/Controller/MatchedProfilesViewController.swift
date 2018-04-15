import UIKit
import Kingfisher

class MatchedProfilesViewController: UIViewController {
  @IBOutlet weak var profileCollectionView: UICollectionView!
  var profileMatches: [MatchedUserProfile] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()

    OkCupidAPIClient.fetchAllMatchedUsers(completion: { [weak self] (clientResponse, matchedUserProfiles) in
      guard let matchedUserProfiles = matchedUserProfiles else { return }
      self?.profileMatches = matchedUserProfiles
      DispatchQueue.main.async {
        self?.profileCollectionView.reloadData()
        print(self?.profileMatches)
      }
    })
  }
  
}

// MARK: - UICollectionViewDataSource
extension MatchedProfilesViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return profileMatches.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userProfileCell", for: indexPath) as! UserProfileCollectionViewCell
    let user = profileMatches[indexPath.item]
    cell.setUpCell(with: user)
    cell.animate()
    return cell
  }
  
}
