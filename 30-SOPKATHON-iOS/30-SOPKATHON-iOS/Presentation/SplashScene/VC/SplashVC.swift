//
//  SplashVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKTemplate
import KakaoSDKLink

class SplashVC: UIViewController {
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var splashIconView: UIImageView!
  
  // MARK: - Life Cycle Part
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.shareAction()

    delayWithSeconds(1) {
      self.showAnimation()
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
  }
  
  private func showAnimation() {
    
    UIView.animate(withDuration: 1, delay: 0) {
      self.splashIconView.alpha = 0
    } completion: { _ in
      self.moveBaseView()
    }
    
  }
  
  private func moveBaseView() {
    let baseVC = ModuleFactory.shared.makeBaseVC()
    self.navigationController?.pushViewController(baseVC, animated: false)
  }
  
  func shareAction() // 친구에게 공유하기
  {
  
  
  
  
  let messageJsonData =
          """
          {
              "object_type": "feed",
              "content": {
                  "title": "국밥마라",
                  "description": "오늘도 마라탕에 빠지고 마라탕...",
          
                  "image_url": "https://picsum.photos/300/300",
                  "link": {
                      "mobile_web_url": "https://developers.kakao.com",
                      "web_url": "https://developers.kakao.com"
                  }
              },
          
              "buttons": [
                  {
                      "title": "나의 마라 혈중농도 확인하러 가기",
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
  
  // MARK: - @objc Function Part
  
}
// MARK: - Extension Part
