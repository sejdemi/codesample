import UIKit
import Kingfisher

class UserProfileCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var userProfileImageView: UIImageView!
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var userAgeCityStateLabel: UILabel!
  @IBOutlet weak var userMatchPercentageLabel: UILabel!
  @IBOutlet weak var userOnlineIndicatorView: UIView!
  
  func setUpCell(with user: MatchedUserProfile) {
    guard let url = URL(string: user.photoThumbnail) else {
      return
    }
    self.userProfileImageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    self.userAgeCityStateLabel.text = "\(user.age) ∙ \(user.city), \(user.state)"
    self.userNameLabel.text = user.username
    self.userMatchPercentageLabel.text = "\(user.matchPercentage)% Match"
    self.userOnlineIndicatorView.layer.cornerRadius = self.userOnlineIndicatorView.frame.width/2
    if user.isOnline == 0 {
      self.userOnlineIndicatorView.isHidden = true
    } else {
      self.userOnlineIndicatorView.isHidden = false
    }
  }
  
  func animate() {
    let finalFrame: CGRect = self.frame
    self.frame = CGRect(x: finalFrame.origin.x - 1000, y: -500, width: 0, height: 0)
    UIView.animate(withDuration: 1, animations: {
      self.frame = finalFrame
    })
  }
  
}

