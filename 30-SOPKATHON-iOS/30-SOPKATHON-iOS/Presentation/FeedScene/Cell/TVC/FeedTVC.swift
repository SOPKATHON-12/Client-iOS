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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Custom Methods
extension FeedTVC {
    func setData(_ feedData: FeedDataModel) {
        profileImageView.image = feedData.gaugeImage
        decibelLabel.text = "\(feedData.gauge) db"
        reasonLabel.text = feedData.reason
    }
}
