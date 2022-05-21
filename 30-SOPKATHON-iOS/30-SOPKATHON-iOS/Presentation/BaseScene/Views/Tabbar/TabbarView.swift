//
//  Tabbar.swift
//  ReadMe-iOS
//
//  Created by 송지훈 on 2022/04/12.
//

import UIKit

protocol MainTabbarDelegate{
  func tabbarClicked(_ type: TabbarIconType)
	func plusButtonClicked()
}

final class TabbarView: XibView{
  var delegate: MainTabbarDelegate?
  private var currentTab: TabbarIconType = .home {
    didSet{ setTabbarViewModel() }
  }
  
  @IBOutlet weak var homeIcon: TabbarIcon!
  @IBOutlet weak var feedIcon: TabbarIcon!
  @IBOutlet weak var rankingIcon: TabbarIcon!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setTabbarViewModel()
  }
  
  @IBAction func homeButtonClicked(_ sender: Any) {
    makeVibrate()
    if currentTab != .feed{
      delegate?.tabbarClicked(.feed)
      currentTab = .feed
    } else {
      postObserverAction(.feedButtonClicked)
    }
  }
  
  
  @IBAction func feedClicked(_ sender: Any) {
    
    
    makeVibrate()
    if currentTab != .home{
      delegate?.tabbarClicked(.home)
      currentTab = .home
    } else {
      postObserverAction(.homeButtonClicked)
    }
    
    

  }
  
  @IBAction func rankingClicked(_ sender: Any) {
    makeVibrate()
    if currentTab != .ranking{
      delegate?.tabbarClicked(.ranking)
      currentTab = .ranking
		} else {
			postObserverAction(.rankingButtonClicked)
		}
  }
    

  private func setTabbarViewModel() {
    
    homeIcon.viewModel = TabbarIconViewModel(type: .feed, clicked: currentTab == .feed)
    feedIcon.viewModel = TabbarIconViewModel(type: .home, clicked: currentTab == .home)
    rankingIcon.viewModel = TabbarIconViewModel(type: .ranking, clicked: currentTab == .ranking)
  }
}
