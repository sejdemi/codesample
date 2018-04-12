import UIKit

class ProfileMatchesViewController: UIViewController {
  
  
  @IBOutlet weak var profileCollectionView: UICollectionView!
  
  var profileMatches: [MatchedUserProfile] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      //capture list is unowned because these values will never become nil
      OkCupidAPIClient.getProfileMatches { [unowned self] (clientResponse, matchedUserProfiles) in
        self.profileMatches = matchedUserProfiles
      }
    }
}

// MARK: - UICollectionViewDataSource

//extension ProfileMatchesViewController: UICollectionViewDataSource {
//
//
//}
//
//// MARK: - UICollectionViewDelegate
//
//extension ProfileMatchesViewController: UICollectionViewDelegate {
//
//
//}

//// MARK: - UITableViewDataSource
//extension MyViewController: UITableViewDataSource {
//    // table view data source methods
//}
//
//// MARK: - UIScrollViewDelegate
//extension MyViewController: UIScrollViewDelegate {
//    // scroll view delegate methods
//}
