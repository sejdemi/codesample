import UIKit

class MatchedProfilesViewController: UIViewController {
  
  
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

extension MatchedProfilesViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return profileMatches.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userProfileCell", for: indexPath)
    
    return cell
  }
  
  

}

// MARK: - UICollectionViewDelegate

extension MatchedProfilesViewController: UICollectionViewDelegate {


}

//// MARK: - UITableViewDataSource
//extension MyViewController: UITableViewDataSource {
//    // table view data source methods
//}
//
//// MARK: - UIScrollViewDelegate
//extension MyViewController: UIScrollViewDelegate {
//    // scroll view delegate methods
//}
