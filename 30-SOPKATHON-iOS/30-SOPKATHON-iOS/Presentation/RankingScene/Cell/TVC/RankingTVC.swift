//
//  RankingTVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 강윤서 on 2022/05/22.
//

import UIKit

class RankingTVC: UITableViewCell {
    
    static let identifier = "RankingTVC"

    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var decibelLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var dBLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 10
        
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
      contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 7, right: 0))
    }
    
    func setData(_ rankingData: RankingDataModel){
//        userImg.image = rankingData.userImg
        userImg.image = UIImage(named: rankingData.userImg)
        nameLabel.text = rankingData.nameLabel
        decibelLabel.text = rankingData.decibelLabel
        rankingLabel.text = rankingData.rankingLabel
    }
}
