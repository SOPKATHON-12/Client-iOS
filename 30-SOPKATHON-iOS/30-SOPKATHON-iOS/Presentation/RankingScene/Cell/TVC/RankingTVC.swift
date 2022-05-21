//
//  RankingTVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 강윤서 on 2022/05/22.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKTemplate
import KakaoSDKLink

class RankingTVC: UITableViewCell {
    
    static let identifier = "RankingTVC"

    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var decibelLabel: UILabel!
    @IBOutlet weak var dBLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 10
        
    }
  @IBAction func shareButtonCLicked(_ sender: Any) {
    shareAction()
    
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
  
  func shareAction() // 친구에게 공유하기
  {
  
  
  
  
  let messageJsonData =
          """
          {
              "object_type": "feed",
              "content": {
                  "title": "한도초과",
                  "description": "오늘 99dB만큼 화가 났어..",
          
                  "image_url": "https://user-images.githubusercontent.com/60260284/169671505-55d27842-7e81-4874-9203-4f6d9be203b8.png",
                  "link": {
                      "mobile_web_url": "https://developers.kakao.com",
                      "web_url": "https://developers.kakao.com"
                  }
              },
          
              "buttons": [
                  {
                      "title": "나의 분노 dB 확인하러 가기",
                      "link": {
                          "mobile_web_url": "https://developers.kakao.com",
                          "web_url": "https://developers.kakao.com"
                      }
                  }
              ]
          }
          """.data(using: .utf8)!
  
  
  
  
  if let templatable = try? SdkJSONDecoder.custom.decode(FeedTemplate.self, from: messageJsonData) {
    LinkApi.shared.defaultLink(templatable: templatable) {(linkResult, error) in
      if let error = error {
        print(error)
        print("여기서 안될걸?2")
      }
      else {
        print("defaultLink() success.")
        
        if let linkResult = linkResult {
          UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
        }
      }
    }
    
    
  }
  }
}
