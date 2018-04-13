import UIKit
import Kingfisher

class MatchedProfilesViewController: UIViewController {
  
  
  @IBOutlet weak var profileCollectionView: UICollectionView!
  
  var profileMatches: [MatchedUserProfile] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //capture list is unowned because these values will never become nil
    OkCupidAPIClient.getProfileMatches { [unowned self] (clientResponse, matchedUserProfiles) in
      self.profileMatches = matchedUserProfiles
      DispatchQueue.main.async {
        self.profileCollectionView.reloadData()
      }
    }
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
    if let url = URL(string: user.photoThumbnail) {
      cell.userProfileImageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
    cell.userAgeLabel.text = String(user.age)
    cell.userCityLabel.text = user.city
    cell.userNameLabel.text = user.username
    cell.userMatchPercentageLabel.text = String(user.matchPercentage)
    
    let finalFrame: CGRect = cell.frame
    cell.frame = CGRect(x: finalFrame.origin.x - 1000, y: -500, width: 0, height: 0)
    UIView.animate(withDuration: 1, animations: {
      cell.frame = finalFrame
    })
    return cell
  }
  
  
  
}

// MARK: - UICollectionViewDelegate

extension MatchedProfilesViewController: UICollectionViewDelegate {
  
  
}


