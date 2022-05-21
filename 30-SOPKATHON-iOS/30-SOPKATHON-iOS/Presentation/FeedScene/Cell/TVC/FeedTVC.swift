//
//  FeedTVC.swift
//  30-SOPKATHON-iOS
//
//  Created by Juhyeon Byun on 2022/05/22.
//

import UIKit

class FeedTVC: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool = true

    // MARK: - IBOutlet
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var decibelLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }
}

// MARK: - Custom Methods
extension FeedTVC {
    func setData(_ feedData: FeedDataModel) {
        profileImageView.image = feedData.gaugeImage
        decibelLabel.text = "\(feedData.gauge) dB"
        reasonLabel.text = feedData.reason
    }
}
