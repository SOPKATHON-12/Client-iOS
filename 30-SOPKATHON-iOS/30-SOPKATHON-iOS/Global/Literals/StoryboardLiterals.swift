//
//  StoryboardLiterals.swift
//  ReadMe-iOS
//
//  Created by 송지훈 on 2022/04/03.
//

import UIKit

enum Storyboards: String {
  case splash = "Splash"
  case base = "Base"
  case home = "Home"
  case soundKing = "SoundKing"
  case touchKing = "TouchKing"
  case writing = "Writing"
  case feed = "Feed"
  case ranking = "Ranking"
  case decibel = "Decibel"
  case tab = "Tab"
}

extension UIStoryboard{
  static func list(_ name : Storyboards) -> UIStoryboard{
    return UIStoryboard(name: name.rawValue, bundle: nil)
  }
}
