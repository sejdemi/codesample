import UIKit
import Kingfisher

class UserProfileCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var userProfileImageView: UIImageView!
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var userAgeLabel: UILabel!
  @IBOutlet weak var userCityLabel: UILabel!
  @IBOutlet weak var userMatchPercentageLabel: UILabel!
  
  func setUpCell(with user: MatchedUserProfile) {
    if let url = URL(string: user.photoThumbnail) {
      self.userProfileImageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
    self.userAgeLabel.text = String(user.age)
    self.userCityLabel.text = user.city
    self.userNameLabel.text = user.username
    self.userMatchPercentageLabel.text = String(user.matchPercentage)
  }
  
  func animate() {
    let finalFrame: CGRect = self.frame
    self.frame = CGRect(x: finalFrame.origin.x - 1000, y: -500, width: 0, height: 0)
    UIView.animate(withDuration: 1, animations: {
      self.frame = finalFrame
    })
  }
}

