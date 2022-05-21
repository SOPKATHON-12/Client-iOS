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
  @IBOutlet weak var iconTitleLabel: UILabel!
  
  var viewModel: TabbarIconViewModel? {
    didSet{
      configureUI()
    }
  }

  private func configureUI() {
    guard let viewModel = viewModel else { return }
    iconTitleLabel.font = .systemFont(ofSize: 12)
    iconTitleLabel.textColor =
    viewModel.clicked ? UIColor.enabledTabbarColor : UIColor.disabledTabbarColor

    switch(viewModel.type){
      case .home:
        iconImageView.image =
        viewModel.clicked ? ImageLiterals.TabBar.homeSelected : ImageLiterals.TabBar.home
        iconTitleLabel.text = I18N.Tabbar.home

      case .feed:
        iconImageView.image =
        viewModel.clicked ? ImageLiterals.TabBar.feedSelected : ImageLiterals.TabBar.feed
        iconTitleLabel.text = I18N.Tabbar.feed
        
      case .ranking:
        iconImageView.image =
        viewModel.clicked ? ImageLiterals.TabBar.rankingSelected : ImageLiterals.TabBar.ranking
        iconTitleLabel.text = I18N.Tabbar.ranking
    }
  }
}

