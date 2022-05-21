//
//  TabbarIcon.swift
//  ReadMe-iOS
//
//  Created by 송지훈 on 2022/04/12.
//

import UIKit

enum TabbarIconType {
  case home
  case feed
  case ranking
}

struct TabbarIconViewModel {
  var type: TabbarIconType
  var clicked: Bool
}

final class TabbarIcon: XibView{
  
  @IBOutlet weak var iconImageView: UIImageView!
  
  var viewModel: TabbarIconViewModel? {
    didSet{
      configureUI()
    }
  }

  private func configureUI() {
    guard let viewModel = viewModel else { return }
    if viewModel.clicked {
      iconImageView.alpha = 1
    } else {
      iconImageView.alpha = 0.5
    }
  
    switch(viewModel.type){
      case .home:
        iconImageView.image = ImageLiterals.TabBar.home

      case .feed:
        iconImageView.image = ImageLiterals.TabBar.feed
        
      case .ranking:
        iconImageView.image = ImageLiterals.TabBar.ranking
    }
  }
}

