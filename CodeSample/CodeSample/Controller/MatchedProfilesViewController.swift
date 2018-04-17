import UIKit
import Kingfisher

class MatchedProfilesViewController: UIViewController {
  @IBOutlet weak var profileCollectionView: UICollectionView!
  var profileMatches: [MatchedUserProfile] = []
  var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
  }
  var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    OkCupidAPIClient.fetchAllMatchedUsers(completion: { [weak self] (clientResponse, matchedUserProfiles) in
      guard let matchedUserProfiles = matchedUserProfiles else {
        return
      }
      self?.profileMatches = matchedUserProfiles
      DispatchQueue.main.async {
        self?.profileCollectionView.reloadData()
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userProfileCell",
                                                    for: indexPath) as! UserProfileCollectionViewCell
    let user = profileMatches[indexPath.item]
    cell.setUpCell(with: user)
    cell.animate()
    return cell
  }
  
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MatchedProfilesViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    var cellWidth: CGFloat
    let cellHeight: CGFloat = screenHeight * 0.429
    if screenWidth < 375 {
       cellWidth = screenWidth * 0.425
    } else {
       cellWidth = screenWidth * 0.44
    }
    return CGSize(width: cellWidth, height: cellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 15
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 15
  }

}
