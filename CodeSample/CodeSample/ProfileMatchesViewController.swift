import UIKit

class ProfileMatchesViewController: UIViewController {
  
  
  @IBOutlet weak var profileCollectionView: UICollectionView!
  
  var profileMatches = [String: Any]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      OkCupidAPIClient.getProfileMatches { (response) in
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
