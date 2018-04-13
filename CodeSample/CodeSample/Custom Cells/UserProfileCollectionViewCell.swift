import UIKit

class UserProfileCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var userProfileImageView: UIImageView!
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var userAgeLabel: UILabel!
  @IBOutlet weak var userCityLabel: UILabel!
  @IBOutlet weak var userMatchPercentageLabel: UILabel!
  
  func animate() {
    let finalFrame: CGRect = self.frame
    self.frame = CGRect(x: finalFrame.origin.x - 1000, y: -500, width: 0, height: 0)
    UIView.animate(withDuration: 1, animations: {
      self.frame = finalFrame
    })
  }
  
}

